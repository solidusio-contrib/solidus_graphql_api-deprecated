class Spree::GraphQL::Schema::Types::Product < Spree::GraphQL::Schema::Types::BaseObjectNode; end
class Spree::GraphQL::Schema::Types::Collection < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'Collection'

  description %q{A collection represents a grouping of products that a shop owner can create to organize them or make their shops easier to browse.}

  include ::Spree::GraphQL::Types::Collection

  field :description, ::GraphQL::Types::String, null: false do
    description %q{Stripped description of the collection.}
  end

  field :handle, ::GraphQL::Types::String, null: false do
    description %q{A human-friendly unique string for the collection automatically generated from its title.
Limit of 255 characters.
}
  end

  field :products, ::Spree::GraphQL::Schema::Types::Product.connection_type, null: false do
    description %q{List of products in the collection.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
    argument :sort_key, ::Spree::GraphQL::Schema::Types::ProductCollectionSortKeys, required: false, default_value: 'COLLECTION_DEFAULT', description: %q{Sort the underlying list by the given key.}
  end

  field :title, ::GraphQL::Types::String, null: false do
    description %q{The collection’s name. Limit of 255 characters.}
  end

  field :updated_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the collection was last modified.}
  end
end
