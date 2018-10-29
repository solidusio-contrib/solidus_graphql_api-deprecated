class Spree::GraphQL::Schema::Types::ProductImageSortKeys < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'ProductImageSortKeys'
  description %q{The set of valid sort keys for the images query.}
  include ::Spree::GraphQL::Types::ProductImageSortKeys
  value 'CREATED_AT', %q{Sort by the `created_at` value.}
  value 'POSITION', %q{Sort by the `position` value.}
  value 'ID', %q{Sort by the `id` value.}
  value 'RELEVANCE', %q{During a search (i.e. when the `query` parameter has been specified on the connection) this sorts the
results by relevance to the search term(s). When no search query is specified, this sort key is not
deterministic and should not be used.
}
end