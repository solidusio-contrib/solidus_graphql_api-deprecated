# frozen_string_literal: true
module Spree::GraphQL::Types::Product
  # availableForSale: Indicates if at least one product variant is available for sale.
  # @return [Types::Boolean!]
  def available_for_sale()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # collections: List of collections a product belongs to.
  # @param reverse [Types::Boolean] (false) Reverse the order of the underlying list.
  # @return [Types::Collection.connection_type!]
  def collections(reverse:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # createdAt: The date and time when the product was created.
  # @return [Types::DateTime!]
  def created_at()
    object.created_at.iso8601
  end

  # description: Description of the product.
  # @param truncate_at [Types::Int] (nil) Truncates string after the given length.
  # @return [Types::String!]
  def description(truncate_at:)
    text = object.description
    (truncate_at ? context[:helpers].truncate(text, length: truncate_at) : text).to_s
  end

  # handle: A human-friendly unique string for the Product automatically generated from its title. They are used by the Liquid templating language to refer to objects.
  # @return [Types::String!]
  def handle()
    object.slug
  end

  # productType: A categorization that a product can be tagged with, commonly used for filtering and searching.
  # @return [Types::String!]
  def product_type()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # publishedAt: The date and time when the product was published to the channel.
  # @return [Types::DateTime!]
  def published_at()
    object.available_on.iso8601
  end

  # tags: A categorization that a product can be tagged with, commonly used for filtering and searching. Each comma-separated tag has a character limit of 255.
  # @return [[Types::String!]!]
  def tags()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # title: The product’s title.
  # @return [Types::String!]
  def title()
    object.name
  end

  # updatedAt: The date and time when the product was last modified.
  # @return [Types::DateTime!]
  def updated_at()
    object.updated_at.iso8601
  end

  # variants: List of the product’s variants.
  # @param reverse [Types::Boolean] (false) Reverse the order of the underlying list.
  # @param sort_key [Types::ProductVariantSortKeys] ('POSITION') Sort the underlying list by the given key.
  # @return [Types::ProductVariant.connection_type!]
  def variants(reverse:, sort_key:)
    ::Spree::GraphQL::Types::ProductVariantSortKeys.apply!(
      object.variants,
      reverse: reverse,
      sort_key: sort_key,
    )
  end

  # vendor: The product’s vendor name.
  # @return [Types::String!]
  def vendor()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end
