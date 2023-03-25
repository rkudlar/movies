source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'cssbundling-rails'
gem 'jsbundling-rails'

gem 'turbo-rails'
gem 'stimulus-rails'

gem 'jbuilder'

gem 'redis', '~> 4.0'

gem 'bootsnap', require: false

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry', '~> 0.14.1'

  gem 'rubocop', '~> 1.41.1', require: false
  gem 'rubocop-rails', '~> 2.17.3', require: false
  gem 'rubocop-rspec', '~> 2.16.0', require: false
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
end
