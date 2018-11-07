class Spree::GraphQL::Schema::Types::FulfillmentLineItem < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'FulfillmentLineItem'
  description %q{Represents a single line item in a fulfillment. There is at most one fulfillment line item for each order line item.}
  include ::Spree::GraphQL::Types::FulfillmentLineItem
  field :line_item, ::Spree::GraphQL::Schema::Types::OrderLineItem, null: false do
    description %q{The associated order's line item.}
  end
  field :quantity, ::GraphQL::Types::Int, null: false do
    description %q{The amount fulfilled in this fulfillment.}
  end
end