ENV['RAILS_ENV'] ||= 'test'


require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'ffaker'
require 'factory_bot'
require 'spree/testing_support/factories'
require 'spree/testing_support/capybara_ext'
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/order_walkthrough'
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

require "rails-controller-testing"
require "rspec/rails"
require "rspec-activemodel-mocks"

require "database_cleaner"
require "with_model"
require "byebug"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

require "spree/testing_support/factories"
require "spree/testing_support/preferences"
require "spree/testing_support/authorization_helpers"

ActiveJob::Base.queue_adapter = :test

RSpec.configure do |config|
  config.backtrace_exclusion_patterns = [/gems\/activesupport/, /gems\/actionpack/, /gems\/rspec/]
  config.color = true
  config.infer_spec_type_from_file_location!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.mock_with :rspec do |c|
    c.syntax = :expect
  end

  config.include FactoryBot::Syntax::Methods
  config.include Spree::TestingSupport::Preferences

  config.extend WithModel

  config.before(:each) do
    Rails.cache.clear
    reset_spree_preferences
  end

  config.include ActiveJob::TestHelper

  config.use_transactional_fixtures = true

  config.example_status_persistence_file_path = "./spec/samples.txt"

  config.order = :random

  Kernel.srand config.seed
end
