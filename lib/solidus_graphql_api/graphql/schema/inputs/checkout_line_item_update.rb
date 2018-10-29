class Spree::GraphQL::Schema::Inputs::CheckoutLineItemUpdate < Spree::GraphQL::Schema::Inputs::BaseInput
  graphql_name 'CheckoutLineItemUpdateInput'
  description %q{Specifies the input fields to update a line item on the checkout.}
  argument :id, ::GraphQL::Types::ID, required: false, description: nil
  argument :variant_id, ::GraphQL::Types::ID, required: false, description: %q{The variant identifier of the line item.}
  argument :quantity, ::GraphQL::Types::Int, required: false, description: %q{The quantity of the line item.}
  argument :custom_attributes, [::Spree::GraphQL::Schema::Inputs::Attribute], required: false, description: %q{Extra information in the form of an array of Key-Value pairs about the line item.}
end