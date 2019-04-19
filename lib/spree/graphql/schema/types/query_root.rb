# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::QueryRoot < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'QueryRoot'

  description 'The schema’s entry-point for queries. This acts as the public, top-level API from which all queries must
 start.'

  field :node, field: ::GraphQL::Relay::Node.field
  field :nodes, field: ::GraphQL::Relay::Node.plural_field

  field :product_by_slug, ::Spree::GraphQL::Schema::Types::Product, null: true do
    description 'Find a product by its slug.'
    argument :slug, ::GraphQL::Types::String, required: true, description: 'The handle of the product.'
  end
  def product_by_slug(slug:)
    Spree::Product.find_by_slug(slug)
  end

  field :products, ::Spree::GraphQL::Schema::Types::Product.connection_type, null: false do
    description 'List of the products.'
    # GraphQL arguments can’t be hashes with open keys, so we have to define `:query` argument as an array of
    # key-value tuples.
    argument :query,
             [Spree::GraphQL::Schema::Inputs::RansackQuery],
             required: false,
             default_value: [{ 'key' => 's', 'value' => 'id asc' }],
             description: 'List of Ransack queries, can be used to filter and sort the results.'
  end
  def products(query:)
    query = Spree::GraphQL::Schema::Inputs::RansackQuery.queries_to_ransack_query(query)
    Spree::Product.ransack(query).result
  end

  field :shop, ::Spree::GraphQL::Schema::Types::Shop, null: false do
    description nil
  end
  def shop
    context[:current_store]
  end
end
