class Spree::GraphQL::Schema::Types::CardBrand < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'CardBrand'
  description %q{Card brand, such as Visa or Mastercard, which can be used for payments.}
  include ::Spree::GraphQL::Types::CardBrand
  value 'VISA', %q{Visa}
  value 'MASTERCARD', %q{Mastercard}
  value 'DISCOVER', %q{Discover}
  value 'AMERICAN_EXPRESS', %q{American Express}
  value 'DINERS_CLUB', %q{Diners Club}
  value 'JCB', %q{JCB}
end