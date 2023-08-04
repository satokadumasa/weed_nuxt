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

