# Delete sidekiq workers
Sidekiq.redis { |conn| conn.flushdb }

# Run generators if there are no users in the database
Generators::Base.call if User.first.nil?
