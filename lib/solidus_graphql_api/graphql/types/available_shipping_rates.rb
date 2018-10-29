# frozen_string_literal: true
module Spree::GraphQL::Types::AvailableShippingRates

  # ready: Whether or not the shipping rates are ready. The `shippingRates` field is `null` when this value is `false`. This field should be polled until its value becomes `true`.
  # @return [Types::Boolean!]
  def ready()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # shippingRates: The fetched shipping rates. `null` until the `ready` field is `true`.
  # @return [[Types::ShippingRate!]]
  def shipping_rates()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end