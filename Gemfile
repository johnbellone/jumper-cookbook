source 'https://rubygems.org'

gem 'berkshelf'
gem 'rake'

group :lint do
  gem 'coveralls', require: false
  gem 'foodcritic'
  gem 'rubocop'
end

group :test, :development do
  gem 'chefspec'
  gem 'kitchen-vagrant'
  gem 'serverspec'
  gem 'test-kitchen'
end
