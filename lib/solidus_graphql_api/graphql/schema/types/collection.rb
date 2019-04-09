# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::Product < Spree::GraphQL::Schema::Types::BaseObjectNode; end
class Spree::GraphQL::Schema::Types::Collection < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'Collection'

  description %q{A collection represents a grouping of products that a shop owner can create to organize them or make their shops easier to browse.}

  field :description, ::GraphQL::Types::String, null: false do
    description %q{Stripped description of the collection.}
  end
  def description
    text = (::Spree::Taxon === object) ? object.description : object.name
    text.to_s.strip
  end

  field :handle, ::GraphQL::Types::String, null: false do
    description %q{A human-friendly unique string for the collection automatically generated from its title.
Limit of 255 characters.
}
  end
  def handle
    (::Spree::Taxon === object) ? object.permalink : nil
  end

  field :products, ::Spree::GraphQL::Schema::Types::Product.connection_type, null: false do
    description %q{List of products in the collection.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
    argument :sort_key, ::Spree::GraphQL::Schema::Types::ProductCollectionSortKeys, required: false, default_value: 'COLLECTION_DEFAULT', description: %q{Sort the underlying list by the given key.}
  end
  def products(reverse:, sort_key:)
    if ::Spree::Taxon === object
      ::Spree::GraphQL::Schema::Types::ProductCollectionSortKeys.apply!(
        object.products,
        reverse: reverse,
        sort_key: sort_key,
      )
    else
      []
    end
  end

  field :title, ::GraphQL::Types::String, null: false do
    description %q{The collection’s name. Limit of 255 characters.}
  end
  def title
    object.name
  end

  field :updated_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the collection was last modified.}
  end
  def updated_at
    object.updated_at
  end
end
