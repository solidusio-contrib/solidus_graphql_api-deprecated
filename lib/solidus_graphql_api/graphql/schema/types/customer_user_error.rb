class Spree::GraphQL::Schema::Types::CustomerUserError < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'CustomerUserError'
  description %q{Represents an error that happens during execution of a customer mutation.}
  implements ::Spree::GraphQL::Schema::Interfaces::DisplayableError
  include ::Spree::GraphQL::Types::CustomerUserError
  field :code, ::Spree::GraphQL::Schema::Types::CustomerErrorCode, null: true do
    description %q{Error code to uniquely identify the error.}
  end
  field :field, [::GraphQL::Types::String], null: true do
    description %q{Path to the input field which caused the error.}
  end
  field :message, ::GraphQL::Types::String, null: false do
    description %q{The error message.}
  end
end