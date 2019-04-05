# frozen_string_literal: true
module Spree::GraphQL::Types::QueryRoot
  # shop
  # @return [Types::Shop!]
  def shop()
    context[:current_store]
  end
end
