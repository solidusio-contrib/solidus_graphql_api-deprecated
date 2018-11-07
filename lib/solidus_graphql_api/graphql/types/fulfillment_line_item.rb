# frozen_string_literal: true
module Spree::GraphQL::Types::FulfillmentLineItem

  # lineItem: The associated order's line item.
  # @return [Types::OrderLineItem!]
  def line_item()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # quantity: The amount fulfilled in this fulfillment.
  # @return [Types::Int!]
  def quantity()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end