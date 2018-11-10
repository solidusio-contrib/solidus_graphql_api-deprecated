# frozen_string_literal: true
module Spree::GraphQL::Types::Product
  include ::ActionView::Helpers::TextHelper
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

  # description: Stripped description of the product, single line with HTML tags removed.
  # @param truncate_at [Types::Int] Truncates string after the given length.
  # @return [Types::String!]
  def description(truncate_at:)
    content = ActionView::Base.full_sanitizer.sanitize(object.description).gsub!(/\s+/, ' ').strip!
    truncate_at ? content.truncate(truncate_at) : content
  end

  # descriptionHtml: The description of the product, complete with HTML formatting.
  # @return [Types::HTML!]
  def description_html()
    object.description
  end

  # handle: A human-friendly unique string for the Product automatically generated from its title. They are used by the Liquid templating language to refer to objects.
  # @return [Types::String!]
  def handle()
    object.slug
  end

  # images: List of images associated with the product.
  # @param reverse [Types::Boolean] (false) Reverse the order of the underlying list.
  # @param sort_key [Types::ProductImageSortKeys] ('POSITION') Sort the underlying list by the given key.
  # @param max_width [Types::Int] Image width in pixels between 1 and 2048. This argument is deprecated: Use `maxWidth` on `Image.transformedSrc` instead.
  # @param max_height [Types::Int] Image height in pixels between 1 and 2048. This argument is deprecated: Use `maxHeight` on `Image.transformedSrc` instead.
  # @param crop [Types::CropRegion] Crops the image according to the specified region. This argument is deprecated: Use `crop` on `Image.transformedSrc` instead.
  # @param scale [Types::Int] (1) Image size multiplier for high-resolution retina displays. Must be between 1 and 3. This argument is deprecated: Use `scale` on `Image.transformedSrc` instead.
  # @return [Types::Image.connection_type!]
  def images(reverse:, sort_key:, max_width:, max_height:, crop:, scale:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # onlineStoreUrl: The online store URL for the product. A value of `null` indicates that the product is not published to the Online Store sales channel.
  # @return [Types::URL]
  def online_store_url()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # options: List of custom product options (maximum of 3 per product).
  # @param first [Types::Int] Truncate the array result to this size.
  # @return [[Types::ProductOption!]!]
  def options(first:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # priceRange: The price range.
  # @return [Types::ProductPriceRange!]
  def price_range()
    raise ::Spree::GraphQL::NotImplementedError.new
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

  # variantBySelectedOptions: Find a product’s variant based on its selected options. This is useful for converting a user’s selection of product options into a single matching variant. If there is not a variant for the selected options, `null` will be returned.
  # @param selected_options [[Inputs::SelectedOption!]!]
  # @return [Types::ProductVariant]
  def variant_by_selected_options(selected_options:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # variants: List of the product’s variants.
  # @param reverse [Types::Boolean] (false) Reverse the order of the underlying list.
  # @param sort_key [Types::ProductVariantSortKeys] ('POSITION') Sort the underlying list by the given key.
  # @return [Types::ProductVariant.connection_type!]
  def variants(reverse:, sort_key:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # vendor: The product’s vendor name.
  # @return [Types::String!]
  def vendor()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end
