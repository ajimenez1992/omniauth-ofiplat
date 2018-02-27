source 'http://rubygems.org'

gemspec

gem 'gem-release'
gem 'rake'

group :development do
  gem 'dotenv'
  gem 'pry'
  gem 'shotgun'
  gem 'sinatra'
  gem 'thin'
end

group :test do
  gem 'guard-rspec', require: false
  gem 'listen'
  gem 'rack-test'
  gem 'rspec'
  gem 'rubocop', '>= 0.30', platforms: [
    :ruby_19, :ruby_20, :ruby_21, :ruby_22
  ]
  gem 'simplecov'
  gem 'webmock'
end
