class Spree::GraphQL::Schema::Types::QueryRoot < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'QueryRoot'
  description %q{The schema’s entry-point for queries. This acts as the public, top-level API from which all queries must start.}

  
  include ::Spree::GraphQL::Types::QueryRoot

  field :shop, ::Spree::GraphQL::Schema::Types::Shop, null: false do
    description nil
  end
end
