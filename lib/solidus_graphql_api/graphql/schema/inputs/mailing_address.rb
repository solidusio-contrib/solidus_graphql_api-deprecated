class Spree::GraphQL::Schema::Inputs::MailingAddress < Spree::GraphQL::Schema::Inputs::BaseInput
  graphql_name 'MailingAddressInput'
  description %q{Specifies the fields accepted to create or update a mailing address.}
  argument :address1, ::GraphQL::Types::String, required: false, default_value: nil, description: nil
  argument :address2, ::GraphQL::Types::String, required: false, default_value: nil, description: nil
  argument :city, ::GraphQL::Types::String, required: false, default_value: nil, description: nil
  argument :company, ::GraphQL::Types::String, required: false, default_value: nil, description: nil
  argument :country, ::GraphQL::Types::String, required: false, default_value: nil, description: nil
  argument :first_name, ::GraphQL::Types::String, required: false, default_value: nil, description: nil
  argument :last_name, ::GraphQL::Types::String, required: false, default_value: nil, description: nil
  argument :phone, ::GraphQL::Types::String, required: false, default_value: nil, description: nil
  argument :province, ::GraphQL::Types::String, required: false, default_value: nil, description: nil
  argument :zip, ::GraphQL::Types::String, required: false, default_value: nil, description: nil
end
