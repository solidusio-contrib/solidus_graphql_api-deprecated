module Spree::GraphQL::Schema::Interfaces::DiscountApplication
  include ::Spree::GraphQL::Schema::Interfaces::BaseInterface
  graphql_name 'DiscountApplication'
  description %q{Discount applications capture the intentions of a discount source at
the time of application.
}
  include ::Spree::GraphQL::Interfaces::DiscountApplication
  definition_methods do
  end
  field :allocation_method, ::Spree::GraphQL::Schema::Types::DiscountApplicationAllocationMethod, null: false do
    description %q{The method by which the discount's value is allocated to its entitled items.}
  end
  field :target_selection, ::Spree::GraphQL::Schema::Types::DiscountApplicationTargetSelection, null: false do
    description %q{Which lines of targetType that the discount is allocated over.}
  end
  field :target_type, ::Spree::GraphQL::Schema::Types::DiscountApplicationTargetType, null: false do
    description %q{The type of line that the discount is applicable towards.}
  end
  field :value, ::Spree::GraphQL::Schema::Types::PricingValue, null: false do
    description %q{The value of the discount application.}
  end
end