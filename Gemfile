source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0.rc1'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.1.2'
gem "simple_form"
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
group :development, :test do
  gem 'sqlite3', '1.3.7'
  gem 'rspec-rails', '2.13.1'
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', github: 'railstutorial/spork-rails'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

group :test do
  gem 'selenium-webdriver', '2.0'
  gem 'capybara', '2.1.0.rc1'
  gem 'factory_girl_rails', '4.2.0'
  gem 'cucumber-rails', '1.3.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'

  # Uncomment these lines on OS X.
  # gem 'rb-fsevent', '0.9.3', :require => false
  # gem 'growl', '1.0.3'

  # Uncomment these lines on Linux.
  # gem 'rb-inotify', '0.9.0'
  # gem 'libnotify', '0.8.0'

  # Uncomment these lines on Windows.
  # gem 'rb-fchange', '0.0.6'
  # gem 'rb-notifu', '0.0.4'
  # gem 'win32console', '1.3.2'
end

group :assets do
  gem 'sass-rails',   '4.0.0.rc1'
  gem "coffee-rails", "~> 4.0.0"
  gem 'uglifier', '1.0.3'
end

gem 'jquery-rails', '2.2.1'
gem 'turbolinks', '1.0.0'
gem 'jbuilder', '1.0.1'

group :production do
  gem 'pg', '0.14.1'
end