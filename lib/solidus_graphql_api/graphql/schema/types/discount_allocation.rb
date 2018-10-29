class Spree::GraphQL::Schema::Types::DiscountAllocation < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'DiscountAllocation'
  description %q{An amount discounting the line that has been allocated by a discount.
}
  include ::Spree::GraphQL::Types::DiscountAllocation
  field :allocated_amount, ::Spree::GraphQL::Schema::Types::MoneyV2, null: false do
    description %q{Amount of discount allocated.}
  end
  field :discount_application, ::Spree::GraphQL::Schema::Interfaces::DiscountApplication, null: false do
    description %q{The discount this allocated amount originated from.}
  end
end