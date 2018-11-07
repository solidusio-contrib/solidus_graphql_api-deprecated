class Spree::GraphQL::Schema::Types::ShippingRate < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'ShippingRate'
  description %q{A shipping rate to be applied to a checkout.}
  include ::Spree::GraphQL::Types::ShippingRate
  field :handle, ::GraphQL::Types::String, null: false do
    description %q{Human-readable unique identifier for this shipping rate.}
  end
  field :price, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description %q{Price of this shipping rate.}
  end
  field :title, ::GraphQL::Types::String, null: false do
    description %q{Title of this shipping rate.}
  end
end