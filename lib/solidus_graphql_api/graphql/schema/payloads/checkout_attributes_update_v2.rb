class Spree::GraphQL::Schema::Payloads::CheckoutAttributesUpdateV2 < Spree::GraphQL::Schema::Payloads::BasePayload
  graphql_name 'CheckoutAttributesUpdateV2Payload'
  description nil
  field :checkout, ::Spree::GraphQL::Schema::Types::Checkout, null: true do
    description %q{The updated checkout object.}
  end
  field :user_errors, [::Spree::GraphQL::Schema::Types::UserError], null: false do
    description %q{List of errors that occurred executing the mutation.}
  end
end