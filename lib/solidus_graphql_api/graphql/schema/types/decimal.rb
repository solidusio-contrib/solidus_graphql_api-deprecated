class Spree::GraphQL::Schema::Types::Decimal < Spree::GraphQL::Schema::Types::BaseScalar
  graphql_name 'Decimal'
  description %q{A signed decimal number, which supports arbitrary precision and is serialized as a string.}
  include ::Spree::GraphQL::Types::Decimal
end