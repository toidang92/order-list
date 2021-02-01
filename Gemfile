source 'https://rubygems.org'

ruby '2.7.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.1'

gem 'pg', '>= 0.18', '< 2.0'

gem 'puma', '~> 5.1'

gem 'sprockets', '~> 3.7.2'
gem 'sass-rails', '>= 6'

gem 'slim-rails'

gem 'react-rails'
gem 'webpacker', '~> 5.2'

gem 'bcrypt', '~> 3.1.7'

gem 'bootsnap', '>= 1.5.1', require: false

gem 'data_migrate'

gem 'simple_form'

# this is an optional gem, it provides a high performance replacement
# to String#blank? a method that is called quite frequently in current
# ActiveRecord, this may change in the future
gem 'fast_blank', platform: :mri

gem 'oj'

gem 'figaro'

# High performance Redis driver
gem 'hiredis'
gem 'redis', require: ['redis', 'redis/connection/hiredis']
gem 'redis-rails'

gem 'exception_notification'

gem 'sidekiq'

gem 'devise'
gem 'devise-async'

gem 'kaminari'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-rails', platforms: [:mri, :mingw, :x64_mingw]
end

group :development, :test do
  gem 'faker'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'database_cleaner-active_record'
end

group :development do
  gem 'capistrano', '~> 3.14.1', require: false
  gem 'capistrano-rails', '~> 1.6.1', require: false
  gem 'capistrano-bundler', '~> 2.0.1', require: false
  gem 'rvm1-capistrano3', '~> 1.4.0', require: false

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
