# frozen_string_literal: true
module Spree::GraphQL::Types::FulfillmentTrackingInfo

  # number: The tracking number of the fulfillment.
  # @return [Types::String]
  def number()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # url: The URL to track the fulfillment.
  # @return [Types::URL]
  def url()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end