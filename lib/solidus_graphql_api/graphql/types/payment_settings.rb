# frozen_string_literal: true
module Spree::GraphQL::Types::PaymentSettings

  # acceptedCardBrands: List of the card brands which the shop accepts.
  # @return [[Types::CardBrand!]!]
  def accepted_card_brands()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # cardVaultUrl: The url pointing to the endpoint to vault credit cards.
  # @return [Types::URL!]
  def card_vault_url()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

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

  # solidusPaymentsAccountId: The shop’s Solidus Payments account id.
  # @return [Types::String]
  def solidus_payments_account_id()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # supportedDigitalWallets: List of the digital wallets which the shop supports.
  # @return [[Types::DigitalWallet!]!]
  def supported_digital_wallets()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end
