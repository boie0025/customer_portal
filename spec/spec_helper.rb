ENV['MONGOID_ENV'] = 'test'

require 'bundler/setup'
Bundler.setup

require 'database_cleaner'
require 'mongoid'
include Mongoid

require 'support/mongoid'

require 'customer_portal' # and any other gems you need

require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end

end