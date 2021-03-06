source 'https://rubygems.org'

ruby '2.2.1'

# Resolve configuration challenges
gem 'dotenv-rails', :groups => [:development, :test]

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'pg'
gem 'redcarpet'
gem 'aws-sdk', '~> 2'
gem 'capybara'

gem 'foundation-rails', '5.5.1.0'
gem 'slim-rails'

# Enable plain e-mail display
gem 'actionview-encoded_mail_to'

gem 'sitemap_generator'
gem 'fog', '~> 1.29'

gem 'rollbar'
gem 'rest-client'
gem 'lograge'

gem 'newrelic_rpm'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'

  # JavaScript tets
  gem 'poltergeist'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'rack-livereload'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'terminal-notifier-guard'

  # Reduce log clutter
  gem 'quiet_assets'
end

group :production do
  gem 'rails_12factor'
  gem 'puma'
end

