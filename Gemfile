source "https://rubygems.org"

gem "rails", "~> 7.2.0"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false
gem 'carrierwave', '~> 3.0.7'
gem 'rack'
# Authentication
gem "bcrypt", "~> 3.1.7"
gem "jwt", "~> 2.2"

# Background Jobs
gem 'sidekiq-scheduler', '~> 5.0', '>= 5.0.6'
gem 'sidekiq', '~> 7.3', '>= 7.3.1'
gem 'redis', '~> 5.3'
gem 'redis-client', '~> 0.22.0'
gem 'sidekiq-cron'
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false

  
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
