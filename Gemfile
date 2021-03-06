source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rubocop', '~> 0.47.1', require: false
gem 'appsignal',        '~> 1.1.9'
gem 'rack-mini-profiler', require: false

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml-rails', '~> 0.9'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'currencies', require: 'iso4217'

gem 'devise', '~> 4.0'
gem 'factory_girl_rails', '~> 4.0'
gem 'activerecord-session_store'
gem 'intuit-oauth'
gem 'quickbooks-ruby'

gem 'wicked_pdf', '~> 1.1.0'
gem 'wkhtmltopdf-binary'
gem 'mail_interceptor'
gem 'kaminari'

group :production do
  gem 'asset_sync', '~> 1.3.0'
end

group :development, :test do
  gem 'pry-rails'
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'capybara', '~> 2.11.0'
  gem 'capistrano', '~> 3.6'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-passenger'
  gem 'capistrano-rvm'
  gem 'vcr', '~> 3.0', '>= 3.0.3'
  gem 'fakeweb', '~> 1.3.0'
  gem 'shoulda-matchers'
  gem 'database_cleaner',   '~> 1.0'
  gem 'poltergeist',        '~> 1.9.0'
end

group :development do
  gem 'annotate'
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
