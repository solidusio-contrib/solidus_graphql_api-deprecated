class Spree::GraphQL::Schema::Payloads::CustomerAccessTokenCreate < Spree::GraphQL::Schema::Payloads::BasePayload
  graphql_name 'CustomerAccessTokenCreatePayload'
  description nil
  field :customer_access_token, ::Spree::GraphQL::Schema::Types::CustomerAccessToken, null: true do
    description %q{The newly created customer access token object.}
  end
  field :customer_user_errors, [::Spree::GraphQL::Schema::Types::CustomerUserError], null: false do
    description %q{List of errors that occurred executing the mutation.}
  end
end