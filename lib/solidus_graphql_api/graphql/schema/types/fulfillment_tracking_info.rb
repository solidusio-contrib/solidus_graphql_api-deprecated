class Spree::GraphQL::Schema::Types::FulfillmentTrackingInfo < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'FulfillmentTrackingInfo'
  description %q{Tracking information associated with the fulfillment.}
  include ::Spree::GraphQL::Types::FulfillmentTrackingInfo
  field :number, ::GraphQL::Types::String, null: true do
    description %q{The tracking number of the fulfillment.}
  end
  field :url, ::Spree::GraphQL::Schema::Types::URL, null: true do
    description %q{The URL to track the fulfillment.}
  end
end