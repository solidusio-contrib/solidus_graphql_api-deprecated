# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::QueryRoot < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'QueryRoot'

  description %q{The schema’s entry-point for queries. This acts as the public, top-level API from which all queries must start.}

  field :node, field: ::GraphQL::Relay::Node.field
  field :nodes, field: ::GraphQL::Relay::Node.plural_field

  field :products, ::Spree::GraphQL::Schema::Types::Product.connection_type, null: false do
    description %q{List of the products.}
    # GraphQL arguments can’t be hashes with open keys, so we have to define `:search_query` argument as an array of
    # key-value tuples.
    argument :search_query,
             [Spree::GraphQL::Schema::Inputs::SearchQuery],
             required: false,
             default_value: [{ 'key' => 'sort', 'value' => 'id asc' }],
             description: 'List of query search commands.'
  end
  def products(search_query:)
    search_query = search_query.to_h do |search_query_item|
      [search_query_item.key, search_query_item.value]
    end
    ::Spree::Product.ransack(search_query).result
  end

  field :shop, ::Spree::GraphQL::Schema::Types::Shop, null: false do
    description nil
  end
  def shop
    context[:current_store]
  end
end
