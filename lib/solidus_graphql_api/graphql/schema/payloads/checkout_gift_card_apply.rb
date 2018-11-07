class Spree::GraphQL::Schema::Payloads::CheckoutGiftCardApply < Spree::GraphQL::Schema::Payloads::BasePayload
  graphql_name 'CheckoutGiftCardApplyPayload'
  description nil
  field :checkout, ::Spree::GraphQL::Schema::Types::Checkout, null: false do
    description %q{The updated checkout object.}
  end
  field :user_errors, [::Spree::GraphQL::Schema::Types::UserError], null: false do
    description %q{List of errors that occurred executing the mutation.}
  end
end