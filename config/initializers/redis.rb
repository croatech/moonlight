$redis = Redis.new(host: 'localhost', port: 6379)

# typed: strict
host = Rails.env.production? ? 'redis' : 'localhost'
$redis = Redis.new(host: Settings.redis.host, port: Settings.redis.port)