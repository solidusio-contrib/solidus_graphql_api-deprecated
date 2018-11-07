class Spree::GraphQL::Schema::Payloads::CustomerCreate < Spree::GraphQL::Schema::Payloads::BasePayload
  graphql_name 'CustomerCreatePayload'
  description nil
  field :customer, ::Spree::GraphQL::Schema::Types::Customer, null: true do
    description %q{The created customer object.}
  end
  field :customer_user_errors, [::Spree::GraphQL::Schema::Types::CustomerUserError], null: false do
    description %q{List of errors that occurred executing the mutation.}
  end
end