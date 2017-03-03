source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

#gem 'bootstrap-sass'
#gem 'bootstrap-sass-extras'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby





# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'devise'
gem 'browser'
gem 'social-share-button'
gem 'ransack'
#gem 'will_paginate'
gem 'kaminari'
#gema para establecer variables en el controller que luego se utilizan en javascritp
gem 'gon'



# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
 gem 'unicorn'




group :preproduction, :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'quiet_assets'
  gem 'bullet'
  gem 'faker'
  gem 'database_cleaner'
  #gem 'capybara' # integration testing tool for rack based web applications.
  gem 'fuubar'   # RSpec progress bar formatter
  gem 'i18n-tasks' #  helps you find and manage missing and unused translations.
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'poltergeist'
  gem 'coveralls', require: false
  gem 'email_spec'
  #  utility and framework for executing commands in parallel on multiple remote machines, via SSH.
  gem 'capistrano',         '3.5.0', require: false
  gem 'capistrano-rails',   '1.1.6', require: false
  gem 'capistrano-bundler', '1.1.4', require: false
  gem 'capistrano-rvm',              require: false
  # gem 'capistrano3-delayed-job', '~> 1.0'
  gem 'letter_opener_web', '~> 1.3.0'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

