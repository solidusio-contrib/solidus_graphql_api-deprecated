class Spree::GraphQL::Schema::Payloads::CustomerAccessTokenDelete < Spree::GraphQL::Schema::Payloads::BasePayload
  graphql_name 'CustomerAccessTokenDeletePayload'
  description nil
  field :deleted_access_token, ::GraphQL::Types::String, null: true do
    description %q{The destroyed access token.}
  end
  field :deleted_customer_access_token_id, ::GraphQL::Types::String, null: true do
    description %q{ID of the destroyed customer access token.}
  end
  field :user_errors, [::Spree::GraphQL::Schema::Types::UserError], null: false do
    description %q{List of errors that occurred executing the mutation.}
  end
end