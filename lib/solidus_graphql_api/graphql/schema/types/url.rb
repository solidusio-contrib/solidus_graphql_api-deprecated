class Spree::GraphQL::Schema::Types::URL < Spree::GraphQL::Schema::Types::BaseScalar
  graphql_name 'URL'
  description %q{An RFC 3986 and RFC 3987 compliant URI string.}
end
