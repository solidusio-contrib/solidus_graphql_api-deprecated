class Spree::GraphQL::Schema::Types::UserError < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'UserError'
  description %q{Represents an error in the input of a mutation.}
  implements ::Spree::GraphQL::Schema::Interfaces::DisplayableError
  include ::Spree::GraphQL::Types::UserError
  field :field, [::GraphQL::Types::String], null: true do
    description %q{Path to the input field which caused the error.}
  end
  field :message, ::GraphQL::Types::String, null: false do
    description %q{The error message.}
  end
end