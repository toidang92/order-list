# config/initializers/sidekiq.rb
require 'sidekiq'

Redis.exists_returns_integer = false

Sidekiq.logger = Logger.new(Rails.root.join('log', 'sidekiq.log'))
Sidekiq.logger.level = Rails.logger.level

Sidekiq.configure_client do |config|
  config.redis = ConnectionPool.new(size: ENV['REDIS_BG_POOL']) do
    Redis.new({ url: ENV['REDIS_BG_URL'], driver: :hiredis, thread_safe: true })
  end
end

Sidekiq.configure_server do |config|
  config.redis = ConnectionPool.new(size: ENV['REDIS_BG_POOL']) do
    Redis.new({ url: ENV['REDIS_BG_URL'], driver: :hiredis, thread_safe: true })
  end
end
