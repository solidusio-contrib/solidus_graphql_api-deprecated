class Spree::GraphQL::Schema::Payloads::CustomerRecover < Spree::GraphQL::Schema::Payloads::BasePayload
  graphql_name 'CustomerRecoverPayload'
  description nil
  field :user_errors, [::Spree::GraphQL::Schema::Types::UserError], null: false do
    description %q{List of errors that occurred executing the mutation.}
  end
end