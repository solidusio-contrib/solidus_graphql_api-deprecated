# frozen_string_literal: true
module Spree::GraphQL::Types::ManualDiscountApplication
  include ::Spree::GraphQL::Interfaces::DiscountApplication

  # allocationMethod: The method by which the discount's value is allocated to its entitled items.
  # @return [Types::DiscountApplicationAllocationMethod!]
  def allocation_method()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # description: The description of the application.
  # @return [Types::String]
  def description()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # targetSelection: Which lines of targetType that the discount is allocated over.
  # @return [Types::DiscountApplicationTargetSelection!]
  def target_selection()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # targetType: The type of line that the discount is applicable towards.
  # @return [Types::DiscountApplicationTargetType!]
  def target_type()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # title: The title of the application.
  # @return [Types::String!]
  def title()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # value: The value of the discount application.
  # @return [Types::PricingValue!]
  def value()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end