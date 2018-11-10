class Spree::GraphQL::Schema::Types::ProductVariant < Spree::GraphQL::Schema::Types::BaseObjectNode; end
class Spree::GraphQL::Schema::Types::Product < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'Product'
  description %q{A product represents an individual item for sale in a Solidus store. Products are often physical, but they don't have to be.
For example, a digital download (such as a movie, music or ebook file) also qualifies as a product, as do services (such as equipment rental, work for hire, customization of another product or an extended warranty).}
  include ::Spree::GraphQL::Types::Product
  field :available_for_sale, ::GraphQL::Types::Boolean, null: false do
    description %q{Indicates if at least one product variant is available for sale.}
  end
  field :collections, ::Spree::GraphQL::Schema::Types::Collection.connection_type, null: false do
    description %q{List of collections a product belongs to.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
  end
  field :created_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the product was created.}
  end
  field :description, ::GraphQL::Types::String, null: false do
    description %q{Stripped description of the product, single line with HTML tags removed.}
    argument :truncate_at, ::GraphQL::Types::Int, required: false, default_value: nil, description: %q{Truncates string after the given length.}
  end
  field :description_html, ::Spree::GraphQL::Schema::Types::HTML, null: false do
    description %q{The description of the product, complete with HTML formatting.}
  end
  field :handle, ::GraphQL::Types::String, null: false do
    description %q{A human-friendly unique string for the Product automatically generated from its title.
They are used by the Liquid templating language to refer to objects.
}
  end
  field :images, ::Spree::GraphQL::Schema::Types::Image.connection_type, null: false do
    description %q{List of images associated with the product.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
    argument :sort_key, ::Spree::GraphQL::Schema::Types::ProductImageSortKeys, required: false, default_value: 'POSITION', description: %q{Sort the underlying list by the given key.}
    argument :max_width, ::GraphQL::Types::Int, required: false, description: %q{Image width in pixels between 1 and 2048. This argument is deprecated: Use `maxWidth` on `Image.transformedSrc` instead.}
    argument :max_height, ::GraphQL::Types::Int, required: false, description: %q{Image height in pixels between 1 and 2048. This argument is deprecated: Use `maxHeight` on `Image.transformedSrc` instead.}
    argument :crop, ::Spree::GraphQL::Schema::Types::CropRegion, required: false, description: %q{Crops the image according to the specified region. This argument is deprecated: Use `crop` on `Image.transformedSrc` instead.}
    argument :scale, ::GraphQL::Types::Int, required: false, default_value: 1, description: %q{Image size multiplier for high-resolution retina displays. Must be between 1 and 3. This argument is deprecated: Use `scale` on `Image.transformedSrc` instead.}
  end
  field :online_store_url, ::Spree::GraphQL::Schema::Types::URL, null: true do
    description %q{The online store URL for the product.
A value of `null` indicates that the product is not published to the Online Store sales channel.
}
  end
  field :options, [::Spree::GraphQL::Schema::Types::ProductOption], null: false do
    description %q{List of custom product options (maximum of 3 per product).}
    argument :first, ::GraphQL::Types::Int, required: false, description: %q{Truncate the array result to this size.}
  end
  field :price_range, ::Spree::GraphQL::Schema::Types::ProductPriceRange, null: false do
    description %q{The price range.}
  end
  field :product_type, ::GraphQL::Types::String, null: false do
    description %q{A categorization that a product can be tagged with, commonly used for filtering and searching.}
  end
  field :published_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the product was published to the channel.}
  end
  field :tags, [::GraphQL::Types::String], null: false do
    description %q{A categorization that a product can be tagged with, commonly used for filtering and searching.
Each comma-separated tag has a character limit of 255.
}
  end
  field :title, ::GraphQL::Types::String, null: false do
    description %q{The product’s title.}
  end
  field :updated_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the product was last modified.}
  end
  field :variant_by_selected_options, ::Spree::GraphQL::Schema::Types::ProductVariant, null: true do
    description %q{Find a product’s variant based on its selected options.
This is useful for converting a user’s selection of product options into a single matching variant.
If there is not a variant for the selected options, `null` will be returned.
}
    argument :selected_options, [::Spree::GraphQL::Schema::Inputs::SelectedOption], required: true, description: nil
  end
  field :variants, ::Spree::GraphQL::Schema::Types::ProductVariant.connection_type, null: false do
    description %q{List of the product’s variants.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
    argument :sort_key, ::Spree::GraphQL::Schema::Types::ProductVariantSortKeys, required: false, default_value: 'POSITION', description: %q{Sort the underlying list by the given key.}
  end
  field :vendor, ::GraphQL::Types::String, null: false do
    description %q{The product’s vendor name.}
  end
end
