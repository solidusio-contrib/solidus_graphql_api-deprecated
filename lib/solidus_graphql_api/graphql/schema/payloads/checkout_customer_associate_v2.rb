class Spree::GraphQL::Schema::Payloads::CheckoutCustomerAssociateV2 < Spree::GraphQL::Schema::Payloads::BasePayload
  graphql_name 'CheckoutCustomerAssociateV2Payload'
  description nil
  field :checkout, ::Spree::GraphQL::Schema::Types::Checkout, null: true do
    description %q{The updated checkout object.}
  end
  field :customer, ::Spree::GraphQL::Schema::Types::Customer, null: true do
    description %q{The associated customer object.}
  end
  field :user_errors, [::Spree::GraphQL::Schema::Types::UserError], null: false do
    description %q{List of errors that occurred executing the mutation.}
  end
end