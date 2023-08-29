# README
■ Deploy Front
```bash
# git clone
$> git clone https://github.com/satokadumasa/weed_nuxt.git
```

# edit your environment variable.
```bash
$> cd weed_next/front-app
$> vi .env
$> yarn install
$> yarn dev

$> cd ../weed_next/api-app
$> cp example.env .env
$> vi .env

$> bundle install
$> bundle exec rails db:create
$> bundle exec rails db:migrate
$> bundle exec rails s

```

■ edit rails credentials:edit
```bash
$> EDITOR=vi rails credentials:edit

# aws:
#   access_key_id: 123
#   secret_access_key: 345
gmail:
  mail_address: (your gmail account)
  app_password: (your gmail application password)

# Used as the base secret for all MessageVerifiers in Rails, including the one protecting cookies.
secret_key_base: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

■ create or edit session_store.rb
```bash
$> vi config/initializers/session_store.rb

if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_auth-app-api', domain: 'www.hogehoge.com'
else
  Rails.application.config.session_store :cookie_store, key: '_auth-app-api', domain: 'next_front.example.com'
end
```

■ nginx virtual host conf
● API
```bash
upstream backend {
  server unix:/home/ubuntu/Projects/weed_nuxt/api-app/tmp/sockets/puma.sock;
}

server {
  server_name weed_api.example.com;
  listen 80;

  root /home/ubuntu/Projects/weed_nuxt/api-app/public;

  location / {
    try_files $uri @app;
  }

  location @app {
    proxy_set_header    Host                $http_host;
    proxy_set_header    X-Real-IP           $remote_addr;
    proxy_set_header    X-Forwarded-Host    $host;
    proxy_set_header    X-Forwarded-For     $proxy_add_x_forwarded_for;
    proxy_set_header    X-Forwarded-Proto   $scheme;
    proxy_pass http://backend;
  }

  location /cable {
    #proxy_pass http://backend/cable;
    proxy_pass http://backend;
    proxy_http_version 1.1;
    proxy_set_header Upgrade websocket;
    #proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection Upgrade;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    #proxy_set_header X-Forwarded-Proto https;
    proxy_set_header X-Forwarded-Proto http;
    proxy_set_header Host $host;
    proxy_redirect off;
 }
}
```

● Front
```bash
server {             # the port nginx is listening on
    server_name     weed_front2.example.com;    # setup your domain here
    listen 80; # managed by Certbot

    gzip            on;
    gzip_types      text/plain application/xml text/css application/javascript;
    gzip_min_length 1000;

    location / {
        proxy_redirect                      off;
        proxy_set_header Host               $host;
        proxy_set_header X-Real-IP          $remote_addr;
        proxy_set_header X-Forwarded-For    $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto  $scheme;
        proxy_read_timeout          1m;
        proxy_connect_timeout       1m;
        proxy_pass                          http://localhost:3000; # set the address of the Node.js instance here
    }
}
```
● Admin Front
```bash
server {             # the port nginx is listening on
    server_name     weed_admin.example.com;    # setup your domain here
    listen 80; # managed by Certbot

    gzip            on;
    gzip_types      text/plain application/xml text/css application/javascript;
    gzip_min_length 1000;

    location / {
        proxy_redirect                      off;
        proxy_set_header Host               $host;
        proxy_set_header X-Real-IP          $remote_addr;
        proxy_set_header X-Forwarded-For    $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto  $scheme;
        proxy_read_timeout          1m;
        proxy_connect_timeout       1m;
        proxy_pass                          http://localhost:3010; # set the address of the Node.js instance here
    }
}
```
