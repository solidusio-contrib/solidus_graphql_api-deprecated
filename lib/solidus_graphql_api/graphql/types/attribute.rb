# frozen_string_literal: true
module Spree::GraphQL::Types::Attribute

  # key: Key or name of the attribute.
  # @return [Types::String!]
  def key()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # value: Value of the attribute.
  # @return [Types::String]
  def value()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end