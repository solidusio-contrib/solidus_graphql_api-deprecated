class Spree::GraphQL::Schema::Payloads::CustomerUpdate < Spree::GraphQL::Schema::Payloads::BasePayload
  graphql_name 'CustomerUpdatePayload'
  description nil
  field :customer, ::Spree::GraphQL::Schema::Types::Customer, null: true do
    description %q{The updated customer object.}
  end
  field :customer_access_token, ::Spree::GraphQL::Schema::Types::CustomerAccessToken, null: true do
    description %q{The newly created customer access token. If the customer's password is updated, all previous access tokens
(including the one used to perform this mutation) become invalid, and a new token is generated.
}
  end
  field :customer_user_errors, [::Spree::GraphQL::Schema::Types::CustomerUserError], null: false do
    description %q{List of errors that occurred executing the mutation.}
  end
end