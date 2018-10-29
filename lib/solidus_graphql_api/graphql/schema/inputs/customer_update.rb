class Spree::GraphQL::Schema::Inputs::CustomerUpdate < Spree::GraphQL::Schema::Inputs::BaseInput
  graphql_name 'CustomerUpdateInput'
  description %q{Specifies the fields required to update the Customer information.}
  argument :first_name, ::GraphQL::Types::String, required: false, description: %q{The customer’s first name.}
  argument :last_name, ::GraphQL::Types::String, required: false, description: %q{The customer’s last name.}
  argument :email, ::GraphQL::Types::String, required: false, description: %q{The customer’s email.}
  argument :phone, ::GraphQL::Types::String, required: false, description: %q{The customer’s phone number.}
  argument :password, ::GraphQL::Types::String, required: false, description: %q{The login password used by the customer.}
  argument :accepts_marketing, ::GraphQL::Types::Boolean, required: false, description: %q{Indicates whether the customer has consented to be sent marketing material via email.}
end