class Spree::GraphQL::Schema::Types::PageInfo < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'PageInfo'
  description %q{Information about pagination in a connection.}
  include ::Spree::GraphQL::Types::PageInfo
  field :has_next_page, ::GraphQL::Types::Boolean, null: false do
    description %q{Indicates if there are more pages to fetch.}
  end
  field :has_previous_page, ::GraphQL::Types::Boolean, null: false do
    description %q{Indicates if there are any pages prior to the current page.}
  end
end