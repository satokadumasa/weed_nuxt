# if Rails.env === 'production'
#   Rails.application.config.session_store :cookie_store, key: '_auth-app-api', domain: 'www.september-rain.com'
# else
#   Rails.application.config.session_store :cookie_store, key: '_auth-app-api', domain: 'weed_front.example.com'
# end
if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_auth-app-api', domain: 'www.september-rain.com'
else
  Rails.application.config.session_store :cookie_store, key: '_auth-app-api', domain: 'weed_front.example.com'
end