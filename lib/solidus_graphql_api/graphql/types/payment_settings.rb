# frozen_string_literal: true
module Spree::GraphQL::Types::PaymentSettings
  # countryCode: The country where the shop is located.
  # @return [Types::CountryCode!]
  def country_code()
    object.country_code
  end

  # currencyCode: The three-letter code for the currency that the shop accepts.
  # @return [Types::CurrencyCode!]
  def currency_code()
    object.currency_code
  end
end
