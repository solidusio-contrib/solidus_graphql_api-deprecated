class Spree::GraphQL::Schema::Inputs::CheckoutAttributesUpdate < Spree::GraphQL::Schema::Inputs::BaseInput
  graphql_name 'CheckoutAttributesUpdateInput'
  description %q{Specifies the fields required to update a checkout's attributes.}
  argument :note, ::GraphQL::Types::String, required: false, default_value: nil, description: %q{The text of an optional note that a shop owner can attach to the checkout.}
  argument :custom_attributes, [::Spree::GraphQL::Schema::Inputs::Attribute], required: false, default_value: nil, description: %q{A list of extra information that is added to the checkout.}
  argument :allow_partial_addresses, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Allows setting partial addresses on a Checkout, skipping the full validation of attributes.
The required attributes are city, province, and country.
Full validation of the addresses is still done at complete time.
}
end
