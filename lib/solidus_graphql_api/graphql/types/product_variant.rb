# frozen_string_literal: true
module Spree::GraphQL::Types::ProductVariant

  # availableForSale: Indicates if the product variant is available for sale.
  # @return [Types::Boolean!]
  def available_for_sale()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # product: The product object that the product variant belongs to.
  # @return [Types::Product!]
  def product()
    object.product
  end

  # sku: The SKU (stock keeping unit) associated with the variant.
  # @return [Types::String]
  def sku()
    object.sku
  end

  # title: The product variant’s title.
  # @return [Types::String!]
  def title()
    object.name
  end

  # weight: The weight of the product variant in the unit system specified with `weight_unit`.
  # @return [Types::Float]
  def weight()
    object.weight
  end

  # weightUnit: Unit of measurement for weight.
  # @return [Types::WeightUnit!]
  def weight_unit()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end
