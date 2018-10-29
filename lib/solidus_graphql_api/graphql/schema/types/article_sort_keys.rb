class Spree::GraphQL::Schema::Types::ArticleSortKeys < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'ArticleSortKeys'
  description %q{The set of valid sort keys for the articles query.}
  include ::Spree::GraphQL::Types::ArticleSortKeys
  value 'TITLE', %q{Sort by the `title` value.}
  value 'BLOG_TITLE', %q{Sort by the `blog_title` value.}
  value 'AUTHOR', %q{Sort by the `author` value.}
  value 'UPDATED_AT', %q{Sort by the `updated_at` value.}
  value 'PUBLISHED_AT', %q{Sort by the `published_at` value.}
  value 'ID', %q{Sort by the `id` value.}
  value 'RELEVANCE', %q{During a search (i.e. when the `query` parameter has been specified on the connection) this sorts the
results by relevance to the search term(s). When no search query is specified, this sort key is not
deterministic and should not be used.
}
end