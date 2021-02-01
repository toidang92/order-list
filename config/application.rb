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
    config.eager_load_paths += Dir[Rails.root.join('lib', 'utils')]
    config.eager_load_paths += Dir[Rails.root.join('app', 'services')]

    config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), "../app/schedules/*_scheduler.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.autoloader = :zeitwerk #:classic

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.i18n.default_locale = :vi
    config.i18n.available_locales = [:vi, :en]
    config.i18n.fallbacks = [:en]

    # Use a real queuing backend for Active Job (and separate queues per environment)
    config.active_job.queue_adapter = :sidekiq

    config.active_storage.queue = :active_storage_purge
    config.active_storage.analysis = :active_storage_analysis
    config.active_storage.routes_prefix = '/as_uploads'

    config.middleware.delete Rack::Runtime

    config.serviceworker.headers['Service-Worker-Allowed'] = '/'

    config.encoding = 'utf-8'

    config.time_zone = 'Bangkok'

    config.serviceworker.icon_sizes = [36, 72, 128, 256]
  end
end
