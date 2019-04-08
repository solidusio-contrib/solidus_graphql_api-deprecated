class Spree::GraphQL::Schema::Types::ProductVariant < Spree::GraphQL::Schema::Types::BaseObjectNode; end

class Spree::GraphQL::Schema::Types::Product < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'Product'

  description %q{A product represents an individual item for sale in a Solidus store. Products are often physical, but they don't have to be.
For example, a digital download (such as a movie, music or ebook file) also qualifies as a product, as do services (such as equipment rental, work for hire, customization of another product or an extended warranty).}

  field :available_for_sale, ::GraphQL::Types::Boolean, null: false do
    description %q{Indicates if at least one product variant is available for sale.}
  end
  def available_for_sale
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  field :collections, ::Spree::GraphQL::Schema::Types::Collection.connection_type, null: false do
    description %q{List of collections a product belongs to.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
  end
  def collections(reverse:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  field :created_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the product was created.}
  end
  def created_at
    object.created_at
  end

  field :description, ::GraphQL::Types::String, null: false do
    description %q{Stripped description of the product.}
  end
  def description
    object.description.to_s.strip
  end

  field :handle, ::GraphQL::Types::String, null: false do
    description %q{A human-friendly unique string for the Product automatically generated from its title.
They are used by the Liquid templating language to refer to objects.
}
  end
  def handle
    object.slug
  end

  field :product_type, ::GraphQL::Types::String, null: false do
    description %q{A categorization that a product can be tagged with, commonly used for filtering and searching.}
  end
  def product_type
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  field :published_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the product was published to the channel.}
  end
  def published_at
    object.available_on
  end

  field :tags, [::GraphQL::Types::String], null: false do
    description %q{A categorization that a product can be tagged with, commonly used for filtering and searching.
Each comma-separated tag has a character limit of 255.
}
  end
  def tags
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  field :title, ::GraphQL::Types::String, null: false do
    description %q{The product’s title.}
  end
  def title
    object.name
  end

  field :updated_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the product was last modified.}
  end
  def updated_at
    object.updated_at
  end

  field :variants, ::Spree::GraphQL::Schema::Types::ProductVariant.connection_type, null: false do
    description %q{List of the product’s variants.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
    argument :sort_key, ::Spree::GraphQL::Schema::Types::ProductVariantSortKeys, required: false, default_value: 'POSITION', description: %q{Sort the underlying list by the given key.}
  end
  def variants(reverse:, sort_key:)
    ::Spree::GraphQL::Schema::Types::ProductVariantSortKeys.apply!(
      object.variants,
      reverse: reverse,
      sort_key: sort_key,
    )
  end

  field :vendor, ::GraphQL::Types::String, null: false do
    description %q{The product’s vendor name.}
  end
  def vendor
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end
