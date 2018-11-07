module Spree::GraphQL::Schema::Interfaces::DisplayableError
  include ::Spree::GraphQL::Schema::Interfaces::BaseInterface
  graphql_name 'DisplayableError'
  description %q{Represents an error in the input of a mutation.}
  include ::Spree::GraphQL::Interfaces::DisplayableError
  definition_methods do
  end
  field :field, [::GraphQL::Types::String], null: true do
    description %q{Path to the input field which caused the error.}
  end
  field :message, ::GraphQL::Types::String, null: false do
    description %q{The error message.}
  end
end