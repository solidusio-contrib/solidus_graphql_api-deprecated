class Spree::GraphQL::Schema::Types::PricingPercentageValue < Spree::GraphQL::Schema::Types::BaseObject; end
class Spree::GraphQL::Schema::Types::MoneyV2 < Spree::GraphQL::Schema::Types::BaseObject; end
class Spree::GraphQL::Schema::Types::PricingValue < Spree::GraphQL::Schema::Types::BaseUnion
  graphql_name 'PricingValue'
  description %q{The value of the pricing object.}
  possible_types \
    ::Spree::GraphQL::Schema::Types::PricingPercentageValue,
    ::Spree::GraphQL::Schema::Types::MoneyV2
  include ::Spree::GraphQL::Types::PricingValue
end