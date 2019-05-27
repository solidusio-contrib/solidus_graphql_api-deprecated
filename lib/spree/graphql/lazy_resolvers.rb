# frozen_string_literal: true

module Spree::GraphQL::LazyResolvers
  def self.for(graphql_type_class)
    Spree::GraphQL::LazyResolver.lookup_resolver_class graphql_type_class
  end
end
