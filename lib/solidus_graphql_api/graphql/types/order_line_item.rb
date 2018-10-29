# frozen_string_literal: true
module Spree::GraphQL::Types::OrderLineItem

  # customAttributes: List of custom attributes associated to the line item.
  # @return [[Types::Attribute!]!]
  def custom_attributes()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # discountAllocations: The discounts that have been allocated onto the order line item by discount applications.
  # @return [[Types::DiscountAllocation!]!]
  def discount_allocations()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # quantity: The number of products variants associated to the line item.
  # @return [Types::Int!]
  def quantity()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # title: The title of the product combined with title of the variant.
  # @return [Types::String!]
  def title()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # variant: The product variant object associated to the line item.
  # @return [Types::ProductVariant]
  def variant()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end