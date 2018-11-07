# frozen_string_literal: true
module Spree::GraphQL::Types::UserError
  include ::Spree::GraphQL::Interfaces::DisplayableError

  # field: Path to the input field which caused the error.
  # @return [[Types::String!]]
  def field()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # message: The error message.
  # @return [Types::String!]
  def message()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end