# frozen_string_literal: true
module Spree::GraphQL::Types::AppliedGiftCard

  # amountUsed: The amount that was used taken from the Gift Card by applying it.
  # @return [Types::Money!]
  def amount_used()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # balance: The amount left on the Gift Card.
  # @return [Types::Money!]
  def balance()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # lastCharacters: The last characters of the Gift Card code
  # @return [Types::String!]
  def last_characters()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end