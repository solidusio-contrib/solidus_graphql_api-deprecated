class Spree::GraphQL::Schema::Types::ProductVariant < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'ProductVariant'
  description %q{A product variant represents a different version of a product, such as differing sizes or differing colors.}
  include ::Spree::GraphQL::Types::ProductVariant
  field :available_for_sale, ::GraphQL::Types::Boolean, null: false do
    description %q{Indicates if the product variant is available for sale.}
  end
  field :compare_at_price, ::Spree::GraphQL::Schema::Types::Money, null: true do
    description %q{The compare at price of the variant. This can be used to mark a variant as on sale, when `compareAtPrice` is higher than `price`.}
  end
  field :id, ::GraphQL::Types::ID, null: false do
    description %q{Globally unique identifier.}
  end
  field :image, ::Spree::GraphQL::Schema::Types::Image, null: true do
    description %q{Image associated with the product variant. This field falls back to the product image if no image is available.}
    argument :max_width, ::GraphQL::Types::Int, required: false, description: %q{Image width in pixels between 1 and 2048. This argument is deprecated: Use `maxWidth` on `Image.transformedSrc` instead.}
    argument :max_height, ::GraphQL::Types::Int, required: false, description: %q{Image height in pixels between 1 and 2048. This argument is deprecated: Use `maxHeight` on `Image.transformedSrc` instead.}
    argument :crop, ::Spree::GraphQL::Schema::Types::CropRegion, required: false, description: %q{Crops the image according to the specified region. This argument is deprecated: Use `crop` on `Image.transformedSrc` instead.}
    argument :scale, ::GraphQL::Types::Int, required: false, default_value: 1, description: %q{Image size multiplier for high-resolution retina displays. Must be between 1 and 3. This argument is deprecated: Use `scale` on `Image.transformedSrc` instead.}
  end
  field :price, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description %q{The product variant’s price.}
  end
  field :product, ::Spree::GraphQL::Schema::Types::Product, null: false do
    description %q{The product object that the product variant belongs to.}
  end
  field :selected_options, [::Spree::GraphQL::Schema::Types::SelectedOption], null: false do
    description %q{List of product options applied to the variant.}
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
  field :weight_unit, ::Spree::GraphQL::Schema::Types::WeightUnit, null: false do
    description %q{Unit of measurement for weight.}
  end
end
