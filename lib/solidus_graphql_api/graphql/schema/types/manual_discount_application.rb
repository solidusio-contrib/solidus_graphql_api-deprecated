class Spree::GraphQL::Schema::Types::ManualDiscountApplication < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'ManualDiscountApplication'
  description %q{Manual discount applications capture the intentions of a discount that was manually created.
}
  implements ::Spree::GraphQL::Schema::Interfaces::DiscountApplication
  include ::Spree::GraphQL::Types::ManualDiscountApplication
  field :allocation_method, ::Spree::GraphQL::Schema::Types::DiscountApplicationAllocationMethod, null: false do
    description %q{The method by which the discount's value is allocated to its entitled items.}
  end
  field :description, ::GraphQL::Types::String, null: true do
    description %q{The description of the application.}
  end
  field :target_selection, ::Spree::GraphQL::Schema::Types::DiscountApplicationTargetSelection, null: false do
    description %q{Which lines of targetType that the discount is allocated over.}
  end
  field :target_type, ::Spree::GraphQL::Schema::Types::DiscountApplicationTargetType, null: false do
    description %q{The type of line that the discount is applicable towards.}
  end
  field :title, ::GraphQL::Types::String, null: false do
    description %q{The title of the application.}
  end
  field :value, ::Spree::GraphQL::Schema::Types::PricingValue, null: false do
    description %q{The value of the discount application.}
  end
end