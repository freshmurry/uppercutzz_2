Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  
<<<<<<< HEAD
  config.action_mailer.default_url_options = { host: 'https://b173e6c7795744bfa4954fdeadfb5556.vfs.cloud9.us-east-1.amazonaws.com/' }

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.mandrillapp.com',
    port: 587,
    enable_starttls_auto: true,
    user_name: 'lawrencemurry@yahoo.com',
    password: 'k1B7qHvP1E6YymlAikn2QQ',
    authentication: 'login'
  }
=======
  config.web_console.whitelisted_ips = '10.0.2.2'
  
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.action_mailer.default_url_options = { host: 'https://b39ed353fa9a4a9d862e7fdce410e424.vfs.cloud9.us-east-1.amazonaws.com/' }

  # Mailgun Integration
  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.mailgun.org',
    port: 2525,
    domain: 'sandbox849ca54dc98b42888da6976e40db3c35.mailgun.org',
    authentication: 'plain',
    user_name: 'postmaster@sandbox849ca54dc98b42888da6976e40db3c35.mailgun.org',
    password: '20e436f9190a67c9fbb9b852ab52cae8'
  }

>>>>>>> fa99559576358a773b3244ea3403bb0cb38c54ac
end
