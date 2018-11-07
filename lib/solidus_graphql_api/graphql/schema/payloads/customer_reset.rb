class Spree::GraphQL::Schema::Payloads::CustomerReset < Spree::GraphQL::Schema::Payloads::BasePayload
  graphql_name 'CustomerResetPayload'
  description nil
  field :customer, ::Spree::GraphQL::Schema::Types::Customer, null: true do
    description %q{The customer object which was reset.}
  end
  field :customer_access_token, ::Spree::GraphQL::Schema::Types::CustomerAccessToken, null: true do
    description %q{A newly created customer access token object for the customer.}
  end
  field :user_errors, [::Spree::GraphQL::Schema::Types::UserError], null: false do
    description %q{List of errors that occurred executing the mutation.}
  end
end