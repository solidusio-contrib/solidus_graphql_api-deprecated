# frozen_string_literal: true

module Spree::GraphQL::LazyResolver
  ADAPTER = SolidusGraphqlApi::Config.lazy_resolver_adapter_class_name.constantize
  private_constant :ADAPTER

  METHODS_DELEGATED_TO_ADAPTER = %i[
    activate
    adapter_namespace
    clear_cache
    lookup_resolver_class
    require_dependencies
    resolvers_namespace
  ].freeze

  class << self
    delegate(*METHODS_DELEGATED_TO_ADAPTER, to: :adapter)
  end

  def self.adapter
    ADAPTER
  end
end
