# frozen_string_literal: true
module Spree::GraphQL::Types::ProductPriceRange

  # maxVariantPrice: The highest variant's price.
  # @return [Types::MoneyV2!]
  def max_variant_price()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # minVariantPrice: The lowest variant's price.
  # @return [Types::MoneyV2!]
  def min_variant_price()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end