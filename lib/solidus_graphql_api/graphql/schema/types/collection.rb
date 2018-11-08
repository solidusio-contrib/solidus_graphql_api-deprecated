class Spree::GraphQL::Schema::Types::Product < Spree::GraphQL::Schema::Types::BaseObjectNode; end
class Spree::GraphQL::Schema::Types::Collection < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'Collection'
  description %q{A collection represents a grouping of products that a shop owner can create to organize them or make their shops easier to browse.}
  include ::Spree::GraphQL::Types::Collection
  field :description, ::GraphQL::Types::String, null: false do
    description %q{Stripped description of the collection, single line with HTML tags removed.}
    argument :truncate_at, ::GraphQL::Types::Int, required: false, description: %q{Truncates string after the given length.}
  end
  field :description_html, ::Spree::GraphQL::Schema::Types::HTML, null: false do
    description %q{The description of the collection, complete with HTML formatting.}
  end
  field :handle, ::GraphQL::Types::String, null: false do
    description %q{A human-friendly unique string for the collection automatically generated from its title.
Limit of 255 characters.
}
  end
  field :id, ::GraphQL::Types::ID, null: false do
    description %q{Globally unique identifier.}
  end
  field :image, ::Spree::GraphQL::Schema::Types::Image, null: true do
    description %q{Image associated with the collection.}
    argument :max_width, ::GraphQL::Types::Int, required: false, description: %q{Image width in pixels between 1 and 2048. This argument is deprecated: Use `maxWidth` on `Image.transformedSrc` instead.}
    argument :max_height, ::GraphQL::Types::Int, required: false, description: %q{Image height in pixels between 1 and 2048. This argument is deprecated: Use `maxHeight` on `Image.transformedSrc` instead.}
    argument :crop, ::Spree::GraphQL::Schema::Types::CropRegion, required: false, description: %q{Crops the image according to the specified region. This argument is deprecated: Use `crop` on `Image.transformedSrc` instead.}
    argument :scale, ::GraphQL::Types::Int, required: false, default_value: 1, description: %q{Image size multiplier for high-resolution retina displays. Must be between 1 and 3. This argument is deprecated: Use `scale` on `Image.transformedSrc` instead.}
  end
  field :products, ::Spree::GraphQL::Schema::Types::Product.connection_type, null: false do
    description %q{List of products in the collection.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
    argument :sort_key, ::Spree::GraphQL::Schema::Types::ProductCollectionSortKeys, required: false, default_value: 'COLLECTION_DEFAULT', description: %q{Sort the underlying list by the given key.}
  end
  field :title, ::GraphQL::Types::String, null: false do
    description %q{The collection’s name. Limit of 255 characters.}
  end
  field :updated_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the collection was last modified.}
  end
end
