class Spree::GraphQL::Schema::Types::Payment < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'Payment'
  description %q{A payment applied to a checkout.}
  include ::Spree::GraphQL::Types::Payment
  field :amount, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description %q{The amount of the payment.}
  end
  field :billing_address, ::Spree::GraphQL::Schema::Types::MailingAddress, null: true do
    description %q{The billing address for the payment.}
  end
  field :checkout, ::Spree::GraphQL::Schema::Types::Checkout, null: false do
    description %q{The checkout to which the payment belongs.}
  end
  field :credit_card, ::Spree::GraphQL::Schema::Types::CreditCard, null: true do
    description %q{The credit card used for the payment in the case of direct payments.}
  end
  field :error_message, ::GraphQL::Types::String, null: true do
    description %q{An message describing a processing error during asynchronous processing.}
  end
  field :idempotency_key, ::GraphQL::Types::String, null: true do
    description %q{A client-side generated token to identify a payment and perform idempotent operations.}
  end
  field :ready, ::GraphQL::Types::Boolean, null: false do
    description %q{Whether or not the payment is still processing asynchronously.}
  end
  field :test, ::GraphQL::Types::Boolean, null: false do
    description %q{A flag to indicate if the payment is to be done in test mode for gateways that support it.}
  end
  field :transaction, ::Spree::GraphQL::Schema::Types::Transaction, null: true do
    description %q{The actual transaction recorded by Solidus after having processed the payment with the gateway.}
  end
end
