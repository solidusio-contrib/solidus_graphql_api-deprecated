class Spree::GraphQL::Schema::Types::PricingPercentageValue < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'PricingPercentageValue'
  description %q{The value of the percentage pricing object.}
  include ::Spree::GraphQL::Types::PricingPercentageValue
  field :percentage, ::GraphQL::Types::Float, null: false do
    description %q{The percentage value of the object.}
  end
end