class Spree::GraphQL::Schema::Inputs::SelectedOption < Spree::GraphQL::Schema::Inputs::BaseInput
  graphql_name 'SelectedOptionInput'
  description %q{Specifies the input fields required for a selected option.}
  argument :name, ::GraphQL::Types::String, required: true, description: %q{The product option’s name.}
  argument :value, ::GraphQL::Types::String, required: true, description: %q{The product option’s value.}
end