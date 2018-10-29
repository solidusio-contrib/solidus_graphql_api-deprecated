# frozen_string_literal: true
module Spree::GraphQL::Types::CheckoutUserError
  include ::Spree::GraphQL::Interfaces::DisplayableError

  # code: Error code to uniquely identify the error.
  # @return [Types::CheckoutErrorCode]
  def code()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

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