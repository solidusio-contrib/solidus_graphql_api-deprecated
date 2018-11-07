class Spree::GraphQL::Schema::Types::AvailableShippingRates < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'AvailableShippingRates'
  description %q{A collection of available shipping rates for a checkout.}
  include ::Spree::GraphQL::Types::AvailableShippingRates
  field :ready, ::GraphQL::Types::Boolean, null: false do
    description %q{Whether or not the shipping rates are ready.
The `shippingRates` field is `null` when this value is `false`.
This field should be polled until its value becomes `true`.
}
  end
  field :shipping_rates, [::Spree::GraphQL::Schema::Types::ShippingRate], null: true do
    description %q{The fetched shipping rates. `null` until the `ready` field is `true`.}
  end
end