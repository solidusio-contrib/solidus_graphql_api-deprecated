class Spree::GraphQL::Schema::Types::OrderSortKeys < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'OrderSortKeys'
  description %q{The set of valid sort keys for the orders query.}
  include ::Spree::GraphQL::Types::OrderSortKeys
  value 'PROCESSED_AT', %q{Sort by the `processed_at` value.}
  value 'TOTAL_PRICE', %q{Sort by the `total_price` value.}
  value 'ID', %q{Sort by the `id` value.}
  value 'RELEVANCE', %q{During a search (i.e. when the `query` parameter has been specified on the connection) this sorts the
results by relevance to the search term(s). When no search query is specified, this sort key is not
deterministic and should not be used.
}
end