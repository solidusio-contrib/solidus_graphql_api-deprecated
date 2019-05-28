# frozen_string_literal: true

module Spree::GraphQL::LazyResolver::Adapters::BatchLoader::InstallGeneratorHelper
  def add_lazy_resolvers_adapter_dependencies
    gem 'batch-loader', '~> 1.4.0'
  end
end
