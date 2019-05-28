# frozen_string_literal: true

class SolidusGraphqlApi::InstallGenerator < Rails::Generators::Base
  include Spree::GraphQL::LazyResolver.install_generator_helper

  def add_lazy_resolvers_adapter_dependencies
    super
  end
end
