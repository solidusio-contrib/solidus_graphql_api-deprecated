# frozen_string_literal: true

class SolidusGraphqlApi::Engine < Rails::Engine
  require 'spree/core'
  isolate_namespace Spree
  engine_name 'solidus_graphql_api'

  # use rspec for tests
  config.generators do |g|
    g.test_framework :rspec
  end

  config.eager_load_paths << File.expand_path('..', __dir__)

  initializer 'solidus_graphql_api.environment', before: :load_config_initializers do |_app|
    SolidusGraphqlApi::Config = SolidusGraphqlApi::Configuration.new
  end

  def self.activate
    Dir.glob(File.join(File.dirname(__FILE__), '../../app/decorators/**/*.rb')) do |c|
      require_dependency(c)
    end
  end

  config.to_prepare(&method(:activate).to_proc)
end
