# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::QueryRoot < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'QueryRoot'

  description %q{The schema’s entry-point for queries. This acts as the public, top-level API from which all queries must start.}

  field :node, field: ::GraphQL::Relay::Node.field
  field :nodes, field: ::GraphQL::Relay::Node.plural_field

  field :shop, ::Spree::GraphQL::Schema::Types::Shop, null: false do
    description nil
  end
  def shop
    context[:current_store]
  end
end
