class Spree::GraphQL::Schema::Types::ProductSortKeys < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'ProductSortKeys'
  description %q{The set of valid sort keys for the products query.}
  include ::Spree::GraphQL::Types::ProductSortKeys
  value 'TITLE', %q{Sort by the `title` value.}
  value 'PRODUCT_TYPE', %q{Sort by the `product_type` value.}
  value 'VENDOR', %q{Sort by the `vendor` value.}
  value 'UPDATED_AT', %q{Sort by the `updated_at` value.}
  value 'CREATED_AT', %q{Sort by the `created_at` value.}
  value 'BEST_SELLING', %q{Sort by the `best_selling` value.}
  value 'PRICE', %q{Sort by the `price` value.}
  value 'ID', %q{Sort by the `id` value.}
  value 'RELEVANCE', %q{During a search (i.e. when the `query` parameter has been specified on the connection) this sorts the
results by relevance to the search term(s). When no search query is specified, this sort key is not
deterministic and should not be used.
}
end