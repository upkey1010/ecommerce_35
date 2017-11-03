source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem "rails", "~> 5.1.4"
gem "i18n-js"
gem "faker", "1.7.3"
gem "will_paginate", "3.1.5"
gem "bootstrap-will_paginate", "1.0.0"
gem "carrierwave", "1.1.0"
gem "mini_magick", "4.7.0"
gem "fog", "1.40.0"
gem "bootstrap-sass", "3.3.7"
gem "bcrypt", "3.1.11"
gem "config"
gem "jquery-rails"
gem "mysql2", ">= 0.3.18", "< 0.5"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "figaro"
gem "roo"
gem "rspec", "~> 3.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.5"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "rspec-rails", "~> 3.0"
  gem "factory_girl_rails", "~> 4.5.0"
  gem "rails-controller-testing"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "database_cleaner", "~> 1.5"
  gem 'simplecov', :require => false
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
