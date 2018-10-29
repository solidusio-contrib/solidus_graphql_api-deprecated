class Spree::GraphQL::Schema::Payloads::CustomerAddressDelete < Spree::GraphQL::Schema::Payloads::BasePayload
  graphql_name 'CustomerAddressDeletePayload'
  description nil
  field :deleted_customer_address_id, ::GraphQL::Types::String, null: true do
    description %q{ID of the deleted customer address.}
  end
  field :user_errors, [::Spree::GraphQL::Schema::Types::UserError], null: false do
    description %q{List of errors that occurred executing the mutation.}
  end
end