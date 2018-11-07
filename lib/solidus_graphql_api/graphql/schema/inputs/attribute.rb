class Spree::GraphQL::Schema::Inputs::Attribute < Spree::GraphQL::Schema::Inputs::BaseInput
  graphql_name 'AttributeInput'
  description %q{Specifies the input fields required for an attribute.}
  argument :key, ::GraphQL::Types::String, required: true, description: %q{Key or name of the attribute.}
  argument :value, ::GraphQL::Types::String, required: true, description: %q{Value of the attribute.}
end