# typed: strict
Sidekiq.configure_server do |config|
  config.redis = {
    url: Settings.redis.url,
    namespace: "moonlight_sidekiq_#{Rails.env}",
    size: Settings.sidekiq.server_size
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: Settings.redis.url,
    namespace: "moonlight_sidekiq_#{Rails.env}",
    size: Settings.sidekiq.client_size
  }
end

Sidekiq::Extensions.enable_delay!
