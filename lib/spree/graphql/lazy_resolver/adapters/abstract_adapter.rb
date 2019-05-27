# frozen_string_literal: true

class Spree::GraphQL::LazyResolver::Adapters::AbstractAdapter
  def self.activate(_schema)
    raise NotImplementedError
  end

  def self.adapter_namespace
    to_s.sub(/Adapter\z/, '').constantize
  end

  def self.clear_cache
    raise NotImplementedError
  end

  def self.lookup_resolver_class(graphql_type_class)
    resolvers_namespace.const_get graphql_type_class.to_s.demodulize
  end

  def self.require_dependencies
    raise NotImplementedError
  end

  def self.resolvers_namespace
    raise NotImplementedError
  end
end
