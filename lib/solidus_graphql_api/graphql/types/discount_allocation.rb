# frozen_string_literal: true
module Spree::GraphQL::Types::DiscountAllocation

  # allocatedAmount: Amount of discount allocated.
  # @return [Types::MoneyV2!]
  def allocated_amount()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # discountApplication: The discount this allocated amount originated from.
  # @return [Interfaces::DiscountApplication!]
  def discount_application()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end