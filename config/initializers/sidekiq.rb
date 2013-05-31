require 'sidekiq'
require 'sidekiq-status'

# three unicorns = 3 connections
Sidekiq.configure_client do |config|
  config.redis = { :size => 1 }
  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end
end

# so one sidekiq can have 5 connections
Sidekiq.configure_server do |config|
  config.redis = { :size => 5 }
  config.server_middleware do |chain|
    chain.add Sidekiq::Status::ServerMiddleware
  end
end
