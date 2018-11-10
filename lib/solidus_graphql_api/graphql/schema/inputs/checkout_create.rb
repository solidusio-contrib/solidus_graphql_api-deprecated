class Spree::GraphQL::Schema::Inputs::CheckoutCreate < Spree::GraphQL::Schema::Inputs::BaseInput
  graphql_name 'CheckoutCreateInput'
  description %q{Specifies the fields required to create a checkout.}
  argument :email, ::GraphQL::Types::String, required: false, default_value: nil, description: %q{The email with which the customer wants to checkout.}
  argument :line_items, [::Spree::GraphQL::Schema::Inputs::CheckoutLineItem], required: false, default_value: nil, description: %q{A list of line item objects, each one containing information about an item in the checkout.}
  argument :shipping_address, ::Spree::GraphQL::Schema::Inputs::MailingAddress, required: false, default_value: nil, description: %q{The shipping address to where the line items will be shipped.}
  argument :note, ::GraphQL::Types::String, required: false, default_value: nil, description: %q{The text of an optional note that a shop owner can attach to the checkout.}
  argument :custom_attributes, [::Spree::GraphQL::Schema::Inputs::Attribute], required: false, default_value: nil, description: %q{A list of extra information that is added to the checkout.}
  argument :allow_partial_addresses, ::GraphQL::Types::Boolean, required: false, default_value: nil, description: %q{Allows setting partial addresses on a Checkout, skipping the full validation of attributes.
The required attributes are city, province, and country.
Full validation of addresses is still done at complete time.
}
end
