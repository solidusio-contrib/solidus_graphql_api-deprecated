# frozen_string_literal: true
module Spree::GraphQL::Types::Collection
  include ::Spree::GraphQL::Helpers::BaseHelper

  # description: Stripped description of the collection, single line with HTML tags removed.
  # @param truncate_at [Types::Int] (nil) Truncates string after the given length.
  # @return [Types::String!]
  def description(truncate_at:)
    text = (::Spree::Taxon === object) ? object.description : object.name
    sanitize_strip(text, length: truncate_at)
  end

  # handle: A human-friendly unique string for the collection automatically generated from its title. Limit of 255 characters.
  # @return [Types::String!]
  def handle()
    (::Spree::Taxon === object) ? object.permalink : nil
  end

  # products: List of products in the collection.
  # @param reverse [Types::Boolean] (false) Reverse the order of the underlying list.
  # @param sort_key [Types::ProductCollectionSortKeys] ('COLLECTION_DEFAULT') Sort the underlying list by the given key.
  # @return [Types::Product.connection_type!]
  def products(reverse:, sort_key:)
    if ::Spree::Taxon === object
      ::Spree::GraphQL::Types::ProductCollectionSortKeys.apply!(
        object.products,
        reverse: reverse,
        sort_key: sort_key,
      )
    else
      []
    end
  end

  # title: The collection’s name. Limit of 255 characters.
  # @return [Types::String!]
  def title()
    object.name
  end

  # updatedAt: The date and time when the collection was last modified.
  # @return [Types::DateTime!]
  def updated_at()
    object.updated_at.iso8601
  end
end
