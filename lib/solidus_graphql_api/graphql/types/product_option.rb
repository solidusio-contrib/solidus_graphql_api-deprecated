# frozen_string_literal: true
module Spree::GraphQL::Types::ProductOption
  include ::Spree::GraphQL::Interfaces::Node

  # id: Globally unique identifier.
  # @return [Types::ID!]
  def id()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # name: The product option’s name.
  # @return [Types::String!]
  def name()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # values: The corresponding value to the product option name.
  # @return [[Types::String!]!]
  def values()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end