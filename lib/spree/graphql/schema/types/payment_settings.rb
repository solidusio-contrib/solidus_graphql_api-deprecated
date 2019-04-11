# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::PaymentSettings < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'PaymentSettings'

  description %q{Settings related to payments.}

  field :country_code, ::Spree::GraphQL::Schema::Types::CountryCode, null: false do
    description %q{The country where the shop is located.}
  end
  def country_code
    object.country_code
  end

  field :currency_code, ::Spree::GraphQL::Schema::Types::CurrencyCode, null: false do
    description %q{The three-letter code for the currency that the shop accepts.}
  end
  def currency_code
    object.currency_code
  end
end
