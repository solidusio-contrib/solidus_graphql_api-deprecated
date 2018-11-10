# frozen_string_literal: true
module Spree::GraphQL::Types::ProductVariant
  # availableForSale: Indicates if the product variant is available for sale.
  # @return [Types::Boolean!]
  def available_for_sale()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # compareAtPrice: The compare at price of the variant. This can be used to mark a variant as on sale, when `compareAtPrice` is higher than `price`.
  # @return [Types::Money]
  def compare_at_price()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # id: Globally unique identifier.
  # @return [Types::ID!]
  def id()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # image: Image associated with the product variant. This field falls back to the product image if no image is available.
  # @param max_width [Types::Int] Image width in pixels between 1 and 2048. This argument is deprecated: Use `maxWidth` on `Image.transformedSrc` instead.
  # @param max_height [Types::Int] Image height in pixels between 1 and 2048. This argument is deprecated: Use `maxHeight` on `Image.transformedSrc` instead.
  # @param crop [Types::CropRegion] Crops the image according to the specified region. This argument is deprecated: Use `crop` on `Image.transformedSrc` instead.
  # @param scale [Types::Int] (1) Image size multiplier for high-resolution retina displays. Must be between 1 and 3. This argument is deprecated: Use `scale` on `Image.transformedSrc` instead.
  # @return [Types::Image]
  def image(max_width:, max_height:, crop:, scale:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # price: The product variant’s price.
  # @return [Types::Money!]
  def price()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # product: The product object that the product variant belongs to.
  # @return [Types::Product!]
  def product()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # selectedOptions: List of product options applied to the variant.
  # @return [[Types::SelectedOption!]!]
  def selected_options()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # sku: The SKU (stock keeping unit) associated with the variant.
  # @return [Types::String]
  def sku()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # title: The product variant’s title.
  # @return [Types::String!]
  def title()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # weight: The weight of the product variant in the unit system specified with `weight_unit`.
  # @return [Types::Float]
  def weight()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # weightUnit: Unit of measurement for weight.
  # @return [Types::WeightUnit!]
  def weight_unit()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end
