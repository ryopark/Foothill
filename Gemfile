ruby '2.2.2'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery',     '2.1.3'
  gem 'rails-assets-jquery-ujs', '1.0.3'
  gem 'rails-assets-underscore', '1.8.3'
  gem 'rails-assets-bootstrap',  '3.3.4'
end

source 'https://rubygems.org' do
  gem 'aws-sdk',                        '< 2.0'
  gem 'coffee-rails',                   '4.1.0'
  gem 'devise',                         '3.5.1'
  gem 'font-awesome-rails',             '4.3.0.0'
  gem 'foreman',                        '0.78.0'
  gem 'kaminari',                       '0.16.3'
  gem 'jbuilder',                       '2.2.12'
  gem 'meta-tags',                      '2.1.0'
  gem 'paperclip',                      '4.2.1'
  gem 'pg',                             '0.18.1'
  gem 'rails',                          '4.2.1'
  gem 'rails_admin',                    '0.7.0'
  gem 'sass-rails',                     '5.0.3'
  gem 'uglifier',                       '2.7.1'
  gem 'sqlite3'
  gem 'omniauth'
  gem 'omniauth-facebook'
  gem 'ransack'

  group :development, :test do
    gem 'binding_of_caller', '0.7.2'
    gem 'better_errors',     '2.1.1'
    gem 'dotenv-rails',      '2.0.1'
    gem 'pry-byebug',        '3.1.0'
    gem 'pry-rails',         '0.3.4'
    gem 'rspec-rails',       '3.2.1'
  end

  group :development do
    gem 'brakeman',              '3.0.2',  require: false
    gem 'bullet',                '4.14.4'
    gem 'quiet_assets',          '1.1.0'
    gem 'rubocop',               '0.30.0', require: false
    gem 'spring',                '1.6.3'
    gem 'spring-commands-rspec', '1.0.4'
  end

  group :test do
    gem 'database_rewinder',  '0.5.1'
    gem 'factory_girl_rails', '4.5.0'
    gem 'simplecov',          '0.9.2', require: false
    gem 'vcr',                '2.9.3'
    gem 'webmock',            '1.21.0'
  end

  group :production do
    gem 'rails_12factor', '0.0.3'
  end

  group :doc do
    gem 'sdoc', '0.4.1'
  end
end
