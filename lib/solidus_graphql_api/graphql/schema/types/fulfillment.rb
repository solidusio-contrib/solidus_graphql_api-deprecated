class Spree::GraphQL::Schema::Types::Fulfillment < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'Fulfillment'
  description %q{Represents a single fulfillment in an order.}
  include ::Spree::GraphQL::Types::Fulfillment
  field :fulfillment_line_items, ::Spree::GraphQL::Schema::Types::FulfillmentLineItem.connection_type, null: false do
    description %q{List of the fulfillment's line items.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
  end
  field :tracking_company, ::GraphQL::Types::String, null: true do
    description %q{The name of the tracking company.}
  end
  field :tracking_info, [::Spree::GraphQL::Schema::Types::FulfillmentTrackingInfo], null: false do
    description %q{Tracking information associated with the fulfillment,
such as the tracking number and tracking URL.
}
    argument :first, ::GraphQL::Types::Int, required: false, description: %q{Truncate the array result to this size.}
  end
end