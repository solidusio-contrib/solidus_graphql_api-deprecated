class Spree::GraphQL::Schema::Types::SelectedOption < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'SelectedOption'
  description %q{Custom properties that a shop owner can use to define product variants.
Multiple options can exist. Options are represented as: option1, option2, option3, etc.
}
  include ::Spree::GraphQL::Types::SelectedOption
  field :name, ::GraphQL::Types::String, null: false do
    description %q{The product option’s name.}
  end
  field :value, ::GraphQL::Types::String, null: false do
    description %q{The product option’s value.}
  end
end