# README
■ deploy api
```bash
$> git clone https://github.com/satokadumasa/next_web_api.git
$> cd next_web_api

# edit your environment variable.
$> cp example.env .env
$> vi .env

$> bundle install
$> bundle exec rails db:create
$> bundle exec rails db:migrate
$> bundle exev rails s
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
