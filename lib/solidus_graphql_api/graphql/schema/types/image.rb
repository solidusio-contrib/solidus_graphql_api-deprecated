class Spree::GraphQL::Schema::Types::Image < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'Image'
  description %q{Represents an image resource.}
  include ::Spree::GraphQL::Types::Image
  field :alt_text, ::GraphQL::Types::String, null: true do
    description %q{A word or phrase to share the nature or contents of an image.}
  end
  field :id, ::GraphQL::Types::ID, null: true do
    description %q{A unique identifier for the image.}
  end
  field :original_src, ::Spree::GraphQL::Schema::Types::URL, null: false do
    description %q{The location of the original (untransformed) image as a URL.}
  end
  field :transformed_src, ::Spree::GraphQL::Schema::Types::URL, null: false do
    description %q{The location of the transformed image as a URL.

All transformation arguments are considered "best-effort". If they can be applied to an image, they will be.
Otherwise any transformations which an image type does not support will be ignored.
}
    argument :max_width, ::GraphQL::Types::Int, required: false, description: %q{Image width in pixels between 1 and 5760.}
    argument :max_height, ::GraphQL::Types::Int, required: false, description: %q{Image height in pixels between 1 and 5760.}
    argument :crop, ::Spree::GraphQL::Schema::Types::CropRegion, required: false, description: %q{Crops the image according to the specified region.}
    argument :scale, ::GraphQL::Types::Int, required: false, default_value: 1, description: %q{Image size multiplier for high-resolution retina displays. Must be between 1 and 3.}
    argument :preferred_content_type, ::Spree::GraphQL::Schema::Types::ImageContentType, required: false, description: %q{Best effort conversion of image into content type (SVG -> PNG, Anything -> JGP, Anything -> WEBP are supported).}
  end
end