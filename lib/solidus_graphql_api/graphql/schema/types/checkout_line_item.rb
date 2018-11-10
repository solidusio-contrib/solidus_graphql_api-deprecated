class Spree::GraphQL::Schema::Types::CheckoutLineItem < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'CheckoutLineItem'
  description %q{A single line item in the checkout, grouped by variant and attributes.}
  include ::Spree::GraphQL::Types::CheckoutLineItem
  field :custom_attributes, [::Spree::GraphQL::Schema::Types::Attribute], null: false do
    description %q{Extra information in the form of an array of Key-Value pairs about the line item.}
  end
  field :discount_allocations, [::Spree::GraphQL::Schema::Types::DiscountAllocation], null: false do
    description %q{The discounts that have been allocated onto the checkout line item by discount applications.}
  end
  field :quantity, ::GraphQL::Types::Int, null: false do
    description %q{The quantity of the line item.}
  end
  field :title, ::GraphQL::Types::String, null: false do
    description %q{Title of the line item. Defaults to the product's title.}
  end
  field :variant, ::Spree::GraphQL::Schema::Types::ProductVariant, null: true do
    description %q{Product variant of the line item.}
  end
end
