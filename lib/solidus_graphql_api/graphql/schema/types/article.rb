class Spree::GraphQL::Schema::Types::Blog < Spree::GraphQL::Schema::Types::BaseObjectNode; end
class Spree::GraphQL::Schema::Types::Article < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'Article'
  description nil
  include ::Spree::GraphQL::Types::Article
  field :author_v2, ::Spree::GraphQL::Schema::Types::ArticleAuthor, null: true do
    description %q{The article's author.}
  end
  field :blog, ::Spree::GraphQL::Schema::Types::Blog, null: false do
    description %q{The blog that the article belongs to.}
  end
  field :comments, ::Spree::GraphQL::Schema::Types::Comment.connection_type, null: false do
    description %q{List of comments posted on the article.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
  end
  field :content, ::GraphQL::Types::String, null: false do
    description %q{Stripped content of the article, single line with HTML tags removed.}
    argument :truncate_at, ::GraphQL::Types::Int, required: false, description: %q{Truncates string after the given length.}
  end
  field :content_html, ::Spree::GraphQL::Schema::Types::HTML, null: false do
    description %q{The content of the article, complete with HTML formatting.}
  end
  field :excerpt, ::GraphQL::Types::String, null: true do
    description %q{Stripped excerpt of the article, single line with HTML tags removed.}
    argument :truncate_at, ::GraphQL::Types::Int, required: false, description: %q{Truncates string after the given length.}
  end
  field :excerpt_html, ::Spree::GraphQL::Schema::Types::HTML, null: true do
    description %q{The excerpt of the article, complete with HTML formatting.}
  end
  field :handle, ::GraphQL::Types::String, null: false do
    description %q{A human-friendly unique string for the Article automatically generated from its title.
}
  end
  field :id, ::GraphQL::Types::ID, null: false do
    description %q{Globally unique identifier.}
  end
  field :image, ::Spree::GraphQL::Schema::Types::Image, null: true do
    description %q{The image associated with the article.}
    argument :max_width, ::GraphQL::Types::Int, required: false, description: %q{Image width in pixels between 1 and 2048. This argument is deprecated: Use `maxWidth` on `Image.transformedSrc` instead.}
    argument :max_height, ::GraphQL::Types::Int, required: false, description: %q{Image height in pixels between 1 and 2048. This argument is deprecated: Use `maxHeight` on `Image.transformedSrc` instead.}
    argument :crop, ::Spree::GraphQL::Schema::Types::CropRegion, required: false, description: %q{Crops the image according to the specified region. This argument is deprecated: Use `crop` on `Image.transformedSrc` instead.}
    argument :scale, ::GraphQL::Types::Int, required: false, default_value: 1, description: %q{Image size multiplier for high-resolution retina displays. Must be between 1 and 3. This argument is deprecated: Use `scale` on `Image.transformedSrc` instead.}
  end
  field :published_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the article was published.}
  end
  field :tags, [::GraphQL::Types::String], null: false do
    description %q{A categorization that a article can be tagged with.}
  end
  field :title, ::GraphQL::Types::String, null: false do
    description %q{The article’s name.}
  end
  field :url, ::Spree::GraphQL::Schema::Types::URL, null: false do
    description %q{The url pointing to the article accessible from the web.}
  end
end
