class Spree::GraphQL::Schema::Types::HTML < Spree::GraphQL::Schema::Types::BaseScalar
  graphql_name 'HTML'
  description %q{A string containing HTML code.}
  include ::Spree::GraphQL::Types::HTML
end