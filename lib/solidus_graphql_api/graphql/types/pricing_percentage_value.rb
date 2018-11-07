# frozen_string_literal: true
module Spree::GraphQL::Types::PricingPercentageValue

  # percentage: The percentage value of the object.
  # @return [Types::Float!]
  def percentage()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end