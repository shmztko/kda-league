source 'https://rubygems.org'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'rails', '3.2.11'


# Dababase dependecncie
group :production do
  # We'll deploy at Heroku. Heroku only supports postgresql.
  gem 'pg'
end
group :development, :test do
  # SQLite3 syntax 'CREATE TEMPORARY TABLE ~~' dosent work on cygwin.
  # In RoR this syntax used by change_column method in migration script.
  if RUBY_PLATFORM =~ /cygwin/
    gem 'mysql2'
  else
    gem 'sqlite3'
  end
end

gem 'yaml_db'

gem 'jquery-rails'

gem 'haml-rails'

gem 'less-rails'
gem 'twitter-bootstrap-rails'

gem 'jquery-ui-rails'

# 'rspec-rails' must written in root context to generated specs while executing rails command.
gem 'rspec-rails'

# Testing dependencies
group :test do
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
  gem 'ci_reporter'
  gem 'factory_girl_rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
# gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # Normal therubyracer dosent work on windows environment.
  if RUBY_PLATFORM =~ /mingw|cygwin/
    gem 'therubyracer', :git => 'https://github.com/takewo/therubyracer_windows.git'
  else
    gem 'therubyracer', :platforms => :ruby
  end
  gem 'uglifier', '>= 1.0.3'
end


#group :metrics do
#  gem 'ZenTest', '= 4.8.3'
#  gem 'roodi', '~> 2.2.0'
#  gem 'reek', '~> 1.2.13'
#  gem 'flay'
#  gem 'flog'
#end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
