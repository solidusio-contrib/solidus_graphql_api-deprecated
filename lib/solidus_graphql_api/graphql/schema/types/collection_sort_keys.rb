class Spree::GraphQL::Schema::Types::CollectionSortKeys < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'CollectionSortKeys'
  description %q{The set of valid sort keys for the collections query.}
  include ::Spree::GraphQL::Types::CollectionSortKeys
  value 'TITLE', %q{Sort by the `title` value.}
  value 'UPDATED_AT', %q{Sort by the `updated_at` value.}
  value 'ID', %q{Sort by the `id` value.}
  value 'RELEVANCE', %q{During a search (i.e. when the `query` parameter has been specified on the connection) this sorts the
results by relevance to the search term(s). When no search query is specified, this sort key is not
deterministic and should not be used.
}
end