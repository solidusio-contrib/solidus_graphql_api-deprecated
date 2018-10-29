# frozen_string_literal: true
module Spree::GraphQL::Types::SelectedOption

  # name: The product option’s name.
  # @return [Types::String!]
  def name()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # value: The product option’s value.
  # @return [Types::String!]
  def value()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end