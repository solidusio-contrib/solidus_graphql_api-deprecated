# frozen_string_literal: true
module Spree::GraphQL::Types::Transaction

  # amount: The amount of money that the transaction was for.
  # @return [Types::Money!]
  def amount()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # kind: The kind of the transaction.
  # @return [Types::TransactionKind!]
  def kind()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # status: The status of the transaction
  # @return [Types::TransactionStatus!]
  def status()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # test: Whether the transaction was done in test mode or not
  # @return [Types::Boolean!]
  def test()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end