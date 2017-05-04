source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.0'
gem 'hanami-model', '~> 1.0'

gem 'pg'

gem 'interactor', '~> 3.0' # Service objects
gem 'mechanize', '~> 2.0' # Websites interaction

group :development do
  gem 'shotgun' # Code reloading
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
  gem 'pry-byebug' # Debugging and stack navigation
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
