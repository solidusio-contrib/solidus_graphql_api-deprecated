class Spree::GraphQL::Schema::Inputs::Money < Spree::GraphQL::Schema::Inputs::BaseInput
  graphql_name 'MoneyInput'
  description %q{Specifies the fields for a monetary value with currency.}
  argument :amount, ::Spree::GraphQL::Schema::Types::Decimal, required: true, description: %q{Decimal money amount.}
  argument :currency_code, ::Spree::GraphQL::Schema::Types::CurrencyCode, required: true, description: %q{Currency of the money.}
end