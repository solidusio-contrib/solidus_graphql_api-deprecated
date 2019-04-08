ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../dummy/config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'factory_bot'
require 'spree/testing_support/factories'
require 'spree/testing_support/preferences'
require 'solidus_support/extension/rails_helper'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.backtrace_exclusion_patterns = [/gems\/activesupport/, /gems\/actionpack/, /gems\/rspec/]
  config.infer_spec_type_from_file_location!

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = 'spec/examples.txt'

  config.define_derived_metadata(file_path: Regexp.new('/spec/graphql/')) do |metadata|
    metadata[:type] = :graphql
  end

  config.include Spree::GraphQL::Spec::Helpers, type: :graphql

  config.before do
    Spree::Core::Engine.routes.draw do
      get :graphql, to: 'graphql#execute'
      post :graphql, to: 'graphql#execute'
    end
  end
  config.after(:all) do
    Rails.application.reload_routes!
  end
end
