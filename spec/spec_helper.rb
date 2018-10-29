ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../dummy/config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'factory_bot'
require 'spree/testing_support/factories'
require "spree/testing_support/preferences"
#require 'spree/testing_support/authorization_helpers'
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
require "database_cleaner"

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

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

  config.before(:each) do
    Rails.cache.clear
    reset_spree_preferences
  end

  config.use_transactional_fixtures = true
  config.example_status_persistence_file_path = "./spec/samples.txt"
  config.order = :random
  Kernel.srand config.seed

  config.include FactoryBot::Syntax::Methods
  config.include Spree::TestingSupport::Preferences
  config.include RSpec::Rails::RequestExampleGroup
  config.include Spree::GraphQL::Spec::Helpers

  config.before do
    Spree::Core::Engine.routes.draw do
      get "/graphql", to: "graphql#execute"
      post "/graphql", to: "graphql#execute"
    end
  end
  config.after(:all) do
    # Spree::Core::Engine.routes.reload_routes!
    Rails.application.reload_routes!
  end
end
