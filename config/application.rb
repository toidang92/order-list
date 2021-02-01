require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cv
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.generators do |g|
      g.stylesheet_engine = :sass
      g.assets = false
      g.helper = false
      g.test_unit = false
      g.test_framework = :rspec
      g.integration_tool :rspec
    end

    # Auto-load the bot and its subdirectories
    config.enable_dependency_loading = true
    config.autoload_paths += %W(
      #{config.root}/lib/utils
      #{config.root}/lib/plugins
      #{config.root}/app/services
      #{config.root}/app/form_objects
    )

    config.to_prepare do
      Devise::SessionsController.layout 'devise'
      Devise::RegistrationsController.layout proc { |_| user_signed_in? ? 'application' : 'devise' }
      Devise::ConfirmationsController.layout 'devise'
      Devise::UnlocksController.layout 'devise'
      Devise::PasswordsController.layout 'devise'
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.autoloader = :zeitwerk #:classic

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Configure the default encoding used in templates for Ruby 1.9.
    config.time_zone = 'Bangkok'
    config.i18n.available_locales = [:en]
    config.i18n.default_locale = :en

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.encoding = 'utf-8'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**/*.{rb,yml}').to_s]

    # Use a real queuing backend for Active Job (and separate queues per environment)
    config.active_job.queue_adapter = :sidekiq

    config.active_storage.queue = :active_storage_purge
    config.active_storage.analysis = :active_storage_analysis
    config.active_storage.routes_prefix = '/as_uploads'

    config.middleware.delete Rack::Runtime
  end
end
