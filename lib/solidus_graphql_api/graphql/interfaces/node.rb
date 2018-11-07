# frozen_string_literal: true
module Spree::GraphQL::Interfaces::Node

  # id: Globally unique identifier.
  # @return [Types::ID!]
  def id()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end