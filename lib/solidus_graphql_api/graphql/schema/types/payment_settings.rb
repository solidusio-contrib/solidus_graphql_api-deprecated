class Spree::GraphQL::Schema::Types::PaymentSettings < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'PaymentSettings'
  description %q{Settings related to payments.}
  include ::Spree::GraphQL::Types::PaymentSettings
  field :country_code, ::Spree::GraphQL::Schema::Types::CountryCode, null: false do
    description %q{The country where the shop is located.}
  end
  field :currency_code, ::Spree::GraphQL::Schema::Types::CurrencyCode, null: false do
    description %q{The three-letter code for the currency that the shop accepts.}
  end
end
