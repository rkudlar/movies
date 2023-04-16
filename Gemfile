source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'cssbundling-rails'
gem 'jsbundling-rails'

gem 'stimulus-rails'
gem 'turbo-rails'

gem 'jbuilder'

gem 'redis', '~> 4.0'

gem 'bootsnap', require: false

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'active_storage_validations', '~> 1.0', '>= 1.0.3'

gem 'devise', '~> 4.9'
gem 'omniauth', '2.0.0'
gem 'omniauth-google-oauth2', '~> 1.1', '>= 1.1.1'
gem 'omniauth-rails_csrf_protection', '1.0.0'

gem 'config', '~> 4.1'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry', '~> 0.14.1'

  gem 'rubocop', '~> 1.41.1', require: false
  gem 'rubocop-rails', '~> 2.17.3', require: false
  gem 'rubocop-rspec', '~> 2.16.0', require: false

  gem 'faker'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 5.3.0'
end
