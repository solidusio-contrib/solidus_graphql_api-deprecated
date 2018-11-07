# frozen_string_literal: true
module Spree::GraphQL::Types::MoneyV2

  # amount: Decimal money amount.
  # @return [Types::Decimal!]
  def amount()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # currencyCode: Currency of the money.
  # @return [Types::CurrencyCode!]
  def currency_code()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end