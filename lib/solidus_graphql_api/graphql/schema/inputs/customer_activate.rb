class Spree::GraphQL::Schema::Inputs::CustomerActivate < Spree::GraphQL::Schema::Inputs::BaseInput
  graphql_name 'CustomerActivateInput'
  description %q{Specifies the input fields required to activate a customer.}
  argument :activation_token, ::GraphQL::Types::String, required: true, description: %q{The activation token required to activate the customer.}
  argument :password, ::GraphQL::Types::String, required: true, description: %q{New password that will be set during activation.}
end