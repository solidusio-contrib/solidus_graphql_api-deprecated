class Spree::GraphQL::Schema::Types::ProductVariant < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'ProductVariant'
  description %q{A product variant represents a different version of a product, such as differing sizes or differing colors.}
  include ::Spree::GraphQL::Types::ProductVariant
  field :available_for_sale, ::GraphQL::Types::Boolean, null: false do
    description %q{Indicates if the product variant is available for sale.}
  end
  field :product, ::Spree::GraphQL::Schema::Types::Product, null: false do
    description %q{The product object that the product variant belongs to.}
  end
  field :sku, ::GraphQL::Types::String, null: true do
    description %q{The SKU (stock keeping unit) associated with the variant.}
  end
  field :title, ::GraphQL::Types::String, null: false do
    description %q{The product variant’s title.}
  end
  field :weight, ::GraphQL::Types::Float, null: true do
    description %q{The weight of the product variant in the unit system specified with `weight_unit`.}
  end
end
