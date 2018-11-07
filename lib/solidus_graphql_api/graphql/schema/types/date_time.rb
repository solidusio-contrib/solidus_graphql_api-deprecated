class Spree::GraphQL::Schema::Types::DateTime < Spree::GraphQL::Schema::Types::BaseScalar
  graphql_name 'DateTime'
  description %q{An ISO-8601 encoded UTC date time string.}
  include ::Spree::GraphQL::Types::DateTime
end