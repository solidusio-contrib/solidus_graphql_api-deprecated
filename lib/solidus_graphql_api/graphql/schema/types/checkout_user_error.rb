class Spree::GraphQL::Schema::Types::CheckoutUserError < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'CheckoutUserError'
  description %q{Represents an error that happens during execution of a checkout mutation.}
  implements ::Spree::GraphQL::Schema::Interfaces::DisplayableError
  include ::Spree::GraphQL::Types::CheckoutUserError
  field :code, ::Spree::GraphQL::Schema::Types::CheckoutErrorCode, null: true do
    description %q{Error code to uniquely identify the error.}
  end
  field :field, [::GraphQL::Types::String], null: true do
    description %q{Path to the input field which caused the error.}
  end
  field :message, ::GraphQL::Types::String, null: false do
    description %q{The error message.}
  end
end