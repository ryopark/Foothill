source 'https://rubygems.org'
source 'https://rails-assets.org'
ruby '2.1.1'

gem 'rails', '4.1.0'

# ActiveRecord
gem 'activerecord-import'
gem 'rails-observers'

# Decorator
gem 'draper'

# Utility
gem 'dotenv-rails'
gem 'rails_config'
gem 'database_cleaner', require: false
gem 'symbolize'
gem 'ransack'
gem 'mysql2'
gem 'rails_autolink'
gem 'gmaps4rails'
gem 'geocoder'
gem 'grape', '~> 0.12.0'
gem 'paranoia', '~> 2.0'
gem 'paranoia_uniqueness_validator', '~> 1.1.0'
gem 'chronic'
gem 'enumerize'
gem 'opengraph_parser', '~> 0.2.3'
gem 'browser'
gem 'aasm'
gem 'acts-as-taggable-on'
gem 'require_all'
gem 'unscoped_associations'
gem 'acts_as_list'
gem 'natto'
gem 'holidays'
gem 'best_in_place', '~> 3.0.1'
gem 'x-editable-rails'

# Image Upload
gem 'carrierwave'
gem 'fog'
gem 'mini_magick'

# View
gem 'kaminari'
gem 'haml-rails'
gem 'slim-rails'
gem 'simple_form'
gem 'meta-tags'
gem "gretel"

# Auth
gem 'devise', '~> 3.2.4'
gem 'cancancan', '~> 1.9.0'
gem 'rails_admin', '~> 0.6.7'
gem 'omniauth'
gem 'omniauth-facebook'

# 3rd party api client
gem 'instagram'
gem 'slack-notifier'
gem 'chatwork'
gem 'google_drive'
gem 'bitly'

# assets
gem 'sprockets', '2.11.0'

gem 'rails-assets-normalize-scss'
gem 'rails-assets-bootstrap'
gem 'rails-assets-fontawesome', '~> 4.4.0'
gem 'rails-assets-lodash'
gem 'rails-assets-jquery-ui'
gem 'rails-assets-ractive'
gem 'rails-assets-ractive-transitions-slide'
gem 'rails-assets-ractive-transitions-fade'
gem 'rails-assets-moment'
gem 'rails-assets-eonasdan-bootstrap-datetimepicker'
gem 'rails-assets-bootstrap-datepicker'
gem 'rails-assets-purl'
gem 'rails-assets-flexslider'
gem 'rails-assets-bootbox'

# css
gem 'sass', '~> 3.4.13'
gem 'sass-rails', '~> 5.0.1'
gem "compass-rails", github: "Compass/compass-rails", branch: "2-0-stable"

# JS
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'gon', '~> 4.0.3'
gem 'jbuilder', '~> 2.0'
gem 'coffee-rails', '~> 4.0.0'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Jobs
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'delayed-web', github: 'thebestday/delayed-web'

gem 'whenever', require: false

# redis
#NOTE see: https://github.com/websocket-rails/websocket-rails/issues/313
gem 'redis', '3.2.0'
gem 'redis-namespace'
gem 'redis-objects'
gem 'redis-rails'

# websocket
gem 'websocket-rails'

# twilio
gem 'twilio-ruby'

# fluent-logger
gem 'fluent-logger'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0',          group: :doc
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'i18n_generators'
  gem 'erb2haml'
  gem 'haml2slim'
  gem 'rails-erd'
  gem 'rack-mini-profiler'
  gem 'ruby-prof'
  gem 'flamegraph'
  gem 'stackprof'
  gem 'stackprof-webnav'

  # debug
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'

  # mail
  gem 'letter_opener'

  # static analytics
  gem 'pronto'
  gem 'pronto-rubocop'
  gem 'pronto-rails_best_practices'
  gem 'pronto-brakeman', '~> 0.3.0'
  gem 'prid'

  # performance check
  gem 'bullet'
end

group :test do
  gem 'seed-fu', '~> 2.3'
  gem 'webmock'
  gem 'timecop'
  gem 'shoulda-matchers', require: false
  gem 'capybara-email'
end

group :development, :test do
  gem 'hirb'
  gem 'hirb-unicode'
  # testing
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rspec-rails', '~> 3.2.0'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  gem 'capybara', '~> 2.4.0'
  gem 'poltergeist'

  # js testing
  gem 'teaspoon'
  gem 'guard-teaspoon'

  # debug
  gem 'tapp'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'launchy'

  # capistrano
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails'
  gem 'capistrano-rvm', require: false
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
end

group :development, :staging do
  gem 'unicorn'
end

group :development, :production do
  gem 'daemons'
  gem 'sitemap_generator'
end

group :production, :staging do
  gem 'newrelic_rpm'
end
