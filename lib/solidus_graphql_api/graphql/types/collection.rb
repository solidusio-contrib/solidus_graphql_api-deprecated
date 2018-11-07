# frozen_string_literal: true
module Spree::GraphQL::Types::Collection
  include ::Spree::GraphQL::Interfaces::Node

  # description: Stripped description of the collection, single line with HTML tags removed.
  # @param truncate_at [Types::Int] Truncates string after the given length.
  # @return [Types::String!]
  def description(truncate_at:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # descriptionHtml: The description of the collection, complete with HTML formatting.
  # @return [Types::HTML!]
  def description_html()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # handle: A human-friendly unique string for the collection automatically generated from its title. Limit of 255 characters.
  # @return [Types::String!]
  def handle()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # id: Globally unique identifier.
  # @return [Types::ID!]
  def id()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # image: Image associated with the collection.
  # @param max_width [Types::Int] Image width in pixels between 1 and 2048. This argument is deprecated: Use `maxWidth` on `Image.transformedSrc` instead.
  # @param max_height [Types::Int] Image height in pixels between 1 and 2048. This argument is deprecated: Use `maxHeight` on `Image.transformedSrc` instead.
  # @param crop [Types::CropRegion] Crops the image according to the specified region. This argument is deprecated: Use `crop` on `Image.transformedSrc` instead.
  # @param scale [Types::Int] (1) Image size multiplier for high-resolution retina displays. Must be between 1 and 3. This argument is deprecated: Use `scale` on `Image.transformedSrc` instead.
  # @return [Types::Image]
  def image(max_width:, max_height:, crop:, scale:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # products: List of products in the collection.
  # @param reverse [Types::Boolean] (false) Reverse the order of the underlying list.
  # @param sort_key [Types::ProductCollectionSortKeys] ('COLLECTION_DEFAULT') Sort the underlying list by the given key.
  # @return [Types::Product.connection_type!]
  def products(reverse:, sort_key:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # title: The collection’s name. Limit of 255 characters.
  # @return [Types::String!]
  def title()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # updatedAt: The date and time when the collection was last modified.
  # @return [Types::DateTime!]
  def updated_at()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end