require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = false

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false

  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  config.log_level = :info

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  config.action_mailer.perform_caching = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Log disallowed deprecations.
  config.active_support.disallowed_deprecation = :log

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  config.hosts << "api.september-rain.com"
  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new
  # config.action_cable.allowed_request_origins = [ENV['WEED_API_ORIGIN_URL1']]
  config.action_cable.allowed_request_origins = '*'
  config.action_cable.disable_request_forgery_protection = true
  config.hosts << "weed_api.example.com"
  # config.hosts << "api.september-rain.com"
  # Use a different logger for distributed setups.
  # require "syslog/logger"
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  config.active_record.verbose_query_logs = true
  # config.action_mailer.default_url_options = {  host: 'weed_front.example.com', port: 80 }
  config.action_mailer.default_url_options = { host: ENV['WEED_COMFIRM_BASE_URL'] }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    # :enable_starttls_auto => true,
    # :address => 'smtp.gmail.com',
    # :port => 587,
    # :domain => 'september-rain.com',
    # :authentication => :login,
    # # メールアドレス(参照している)
    # :user_name => Rails.application.credentials.gmail[:mail_address],
    # # アプリパスワード(参照している)
    # :password => Rails.application.credentials.gmail[:app_password]
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
  config.middleware.insert_before 0, Rack::Cors do
    allow do
      # origins ENV['WEED_API_ORIGIN_URL1']
      origins '*'
      resource '*',
               headers: :any,
               expose: ["access-token", "expiry", "token-type", "uid", "client"],
               methods: %i[get post put patch delete options head],
               credentials: false
    end
  end
  config.action_cable.url = "wss://api.september-rain.com/cable"
end
