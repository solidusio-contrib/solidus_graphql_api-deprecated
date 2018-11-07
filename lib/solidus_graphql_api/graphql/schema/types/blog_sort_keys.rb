class Spree::GraphQL::Schema::Types::BlogSortKeys < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'BlogSortKeys'
  description %q{The set of valid sort keys for the blogs query.}
  include ::Spree::GraphQL::Types::BlogSortKeys
  value 'HANDLE', %q{Sort by the `handle` value.}
  value 'TITLE', %q{Sort by the `title` value.}
  value 'ID', %q{Sort by the `id` value.}
  value 'RELEVANCE', %q{During a search (i.e. when the `query` parameter has been specified on the connection) this sorts the
results by relevance to the search term(s). When no search query is specified, this sort key is not
deterministic and should not be used.
}
end