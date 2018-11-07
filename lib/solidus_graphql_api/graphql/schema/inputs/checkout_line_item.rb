class Spree::GraphQL::Schema::Inputs::CheckoutLineItem < Spree::GraphQL::Schema::Inputs::BaseInput
  graphql_name 'CheckoutLineItemInput'
  description %q{Specifies the input fields to create a line item on a checkout.}
  argument :custom_attributes, [::Spree::GraphQL::Schema::Inputs::Attribute], required: false, description: %q{Extra information in the form of an array of Key-Value pairs about the line item.}
  argument :quantity, ::GraphQL::Types::Int, required: true, description: %q{The quantity of the line item.}
  argument :variant_id, ::GraphQL::Types::ID, required: true, description: %q{The identifier of the product variant for the line item.}
end