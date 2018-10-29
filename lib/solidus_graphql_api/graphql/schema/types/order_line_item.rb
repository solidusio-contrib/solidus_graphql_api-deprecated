class Spree::GraphQL::Schema::Types::OrderLineItem < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'OrderLineItem'
  description %q{Represents a single line in an order. There is one line item for each distinct product variant.}
  include ::Spree::GraphQL::Types::OrderLineItem
  field :custom_attributes, [::Spree::GraphQL::Schema::Types::Attribute], null: false do
    description %q{List of custom attributes associated to the line item.}
  end
  field :discount_allocations, [::Spree::GraphQL::Schema::Types::DiscountAllocation], null: false do
    description %q{The discounts that have been allocated onto the order line item by discount applications.}
  end
  field :quantity, ::GraphQL::Types::Int, null: false do
    description %q{The number of products variants associated to the line item.}
  end
  field :title, ::GraphQL::Types::String, null: false do
    description %q{The title of the product combined with title of the variant.}
  end
  field :variant, ::Spree::GraphQL::Schema::Types::ProductVariant, null: true do
    description %q{The product variant object associated to the line item.}
  end
end