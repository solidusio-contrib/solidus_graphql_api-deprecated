class Spree::GraphQL::Schema::Types::Money < Spree::GraphQL::Schema::Types::BaseScalar
  graphql_name 'Money'
  description %q{A monetary value string.}
  include ::Spree::GraphQL::Types::Money
end