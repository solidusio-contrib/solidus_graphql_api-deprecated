class Spree::GraphQL::Schema::Types::PaymentSettings < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'PaymentSettings'
  description %q{Settings related to payments.}
  include ::Spree::GraphQL::Types::PaymentSettings
  field :accepted_card_brands, [::Spree::GraphQL::Schema::Types::CardBrand], null: false do
    description %q{List of the card brands which the shop accepts.}
  end
  field :card_vault_url, ::Spree::GraphQL::Schema::Types::URL, null: false do
    description %q{The url pointing to the endpoint to vault credit cards.}
  end
  field :country_code, ::Spree::GraphQL::Schema::Types::CountryCode, null: false do
    description %q{The country where the shop is located.}
  end
  field :currency_code, ::Spree::GraphQL::Schema::Types::CurrencyCode, null: false do
    description %q{The three-letter code for the currency that the shop accepts.}
  end
  field :solidus_payments_account_id, ::GraphQL::Types::String, null: true do
    description %q{The shop’s Solidus Payments account id.}
  end
  field :supported_digital_wallets, [::Spree::GraphQL::Schema::Types::DigitalWallet], null: false do
    description %q{List of the digital wallets which the shop supports.}
  end
end