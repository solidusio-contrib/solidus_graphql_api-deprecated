class Spree::GraphQL::Schema::Payloads::CheckoutCreate < Spree::GraphQL::Schema::Payloads::BasePayload
  graphql_name 'CheckoutCreatePayload'
  description nil
  field :checkout, ::Spree::GraphQL::Schema::Types::Checkout, null: true do
    description %q{The new checkout object.}
  end
  field :checkout_user_errors, [::Spree::GraphQL::Schema::Types::CheckoutUserError], null: false do
    description %q{List of errors that occurred executing the mutation.}
  end
end