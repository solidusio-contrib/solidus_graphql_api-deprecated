class Spree::GraphQL::Schema::Inputs::CreditCardPaymentV2 < Spree::GraphQL::Schema::Inputs::BaseInput
  graphql_name 'CreditCardPaymentInputV2'
  description %q{Specifies the fields required to complete a checkout with
a Solidus vaulted credit card payment.
}
  argument :payment_amount, ::Spree::GraphQL::Schema::Inputs::Money, required: true, description: %q{The amount and currency of the payment.}
  argument :idempotency_key, ::GraphQL::Types::String, required: true, description: %q{A unique client generated key used to avoid duplicate charges. When a duplicate payment is found, the original is returned instead of creating a new one.}
  argument :billing_address, ::Spree::GraphQL::Schema::Inputs::MailingAddress, required: true, description: %q{The billing address for the payment.}
  argument :vault_id, ::GraphQL::Types::String, required: true, description: %q{The ID returned by Solidus's Card Vault.}
  argument :test, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Executes the payment in test mode if possible. Defaults to `false`.}
end