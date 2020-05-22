require 'resque/server'

Resque.redis = Rails.env.production? ? $redis : "localhost:6379"
