class Spree::GraphQL::Schema::Types::DiscountCodeApplication < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'DiscountCodeApplication'
  description %q{Discount code applications capture the intentions of a discount code at
the time that it is applied.
}
  implements ::Spree::GraphQL::Schema::Interfaces::DiscountApplication
  include ::Spree::GraphQL::Types::DiscountCodeApplication
  field :allocation_method, ::Spree::GraphQL::Schema::Types::DiscountApplicationAllocationMethod, null: false do
    description %q{The method by which the discount's value is allocated to its entitled items.}
  end
  field :applicable, ::GraphQL::Types::Boolean, null: false do
    description %q{Specifies whether the discount code was applied successfully.}
  end
  field :code, ::GraphQL::Types::String, null: false do
    description %q{The string identifying the discount code that was used at the time of application.}
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