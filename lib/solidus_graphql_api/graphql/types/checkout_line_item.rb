# frozen_string_literal: true
module Spree::GraphQL::Types::CheckoutLineItem
  include ::Spree::GraphQL::Interfaces::Node

  # customAttributes: Extra information in the form of an array of Key-Value pairs about the line item.
  # @return [[Types::Attribute!]!]
  def custom_attributes()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # discountAllocations: The discounts that have been allocated onto the checkout line item by discount applications.
  # @return [[Types::DiscountAllocation!]!]
  def discount_allocations()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # id: Globally unique identifier.
  # @return [Types::ID!]
  def id()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # quantity: The quantity of the line item.
  # @return [Types::Int!]
  def quantity()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # title: Title of the line item. Defaults to the product's title.
  # @return [Types::String!]
  def title()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # variant: Product variant of the line item.
  # @return [Types::ProductVariant]
  def variant()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end