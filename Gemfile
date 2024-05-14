source "https://rubygems.org"

ruby "3.2.2"

gem "bootsnap", require: false # Reduces boot times through caching; required in config/boot.rb
gem "cssbundling-rails" # Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "devise"
gem "image_processing", "~> 1.2" # Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "jsbundling-rails" # Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "rails", "~> 7.1.2"
gem "redis", ">= 4.0.1"
gem "sassc-rails" # Use SCSS to process CSS
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'sass-rails', '~> 6.0.0'


# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
  gem "factory_bot_rails"
  gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "main"
  gem "pry-rails"
  gem "rspec-rails", "~> 6.0.0"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"


  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  gem "shoulda-matchers", "~> 5.0"
end

gem 'omniauth-google-oauth2'
gem "omniauth-rails_csrf_protection"