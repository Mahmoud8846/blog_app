require 'sidekiq'
require 'sidekiq-cron'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://172.18.0.2:6379/0' }

  # Load the Sidekiq cron job
  schedule_file = "config/sidekiq.yml"

  if File.exist?(schedule_file)
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://172.18.0.2:6379/0' }
end
