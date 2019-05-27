# frozen_string_literal: true

class SolidusGraphqlApi::Configuration < Spree::Preferences::Configuration
  preference :lazy_resolver_adapter_class_name,
             :string,
             default: 'Spree::GraphQL::LazyResolver::Adapters::BatchLoaderAdapter'
end
