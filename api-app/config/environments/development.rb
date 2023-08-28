require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  config.action_mailer.default_url_options = { host: ENV['WEED_COMFIRM_BASE_URL'] }

  # Mailer
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    # メールアドレス(参照している)
    :user_name => Rails.application.credentials.gmail[:mail_address],
    # アプリパスワード(参照している)
    :password => Rails.application.credentials.gmail[:app_password],
    # :user_name => Rails.application.credentials.google[:mail],
    # :password => Rails.application.credentials.google[:password],
    :authentication => :plain,
    :enable_starttls_auto => true
  }

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.allowed_request_origins = [ENV['WEED_API_ORIGIN_URL1']]
  config.action_cable.allowed_request_origins = ['*']
  # config.action_cable.allowed_request_origins = [/http:\/\/*/, /https:\/\/*/]
  config.action_cable.disable_request_forgery_protection = true
  # config.web_console.whitelisted_ips = '0.0.0.0/0'
  config.action_cable.url = "ws://weed_api.example.com:80/cable"
  config.hosts.clear
  config.hosts = [
    "weed_api.example.com",
    "backend",
  ]
  # onfig.middleware.delete ActionDispatch::HostAuthorization
  config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins [ENV['WEED_API_ORIGIN_URL1']]
      # origins '*'
      resource '*',
               headers: :any,
               expose: ["access-token", "expiry", "token-type", "uid", "client"],
               methods: %i[get post put patch delete options head],
               credentials: true
    end
  end
end
