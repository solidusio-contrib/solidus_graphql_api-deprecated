class Spree::GraphQL::Schema::Types::CustomerAccessToken < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'CustomerAccessToken'
  description %q{A CustomerAccessToken represents the unique token required to make modifications to the customer object.}
  include ::Spree::GraphQL::Types::CustomerAccessToken
  field :access_token, ::GraphQL::Types::String, null: false do
    description %q{The customer’s access token.}
  end
  field :expires_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the customer access token expires.}
  end
end