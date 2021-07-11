# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::Product < Spree::GraphQL::Schema::Types::BaseObjectNode
  include Spree::GraphQL::LazyResolver::TypeHelper

  graphql_name 'Product'

  description 'A product represents an individual item for sale in a Solidus store. Products are often physical, but
  they don’t have to be. For example, a digital download (such as a movie, music or ebook file) also qualifies as a
  product, as do services (such as equipment rental, work for hire, customization of another product or an extended
  warranty).'

  field :available, ::GraphQL::Types::Boolean, null: false do
    description 'Indicates if the product is available for sale.'
  end
  def available
    object.available?
  end

  field :available_on, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description 'The first date and the time the product becomes available for sale online in your shop. If the
`available_on` attribute is not set, the product does not appear among the store’s products for sale.'
  end
  def available_on
    object.available_on
  end

  field :collections, ::Spree::GraphQL::Schema::Types::Collection.connection_type, null: false do
    description 'List of collections a product belongs to.'
    argument :reverse,
             ::GraphQL::Types::Boolean,
             required: false,
             default_value: false,
             description: 'Reverse the order of the underlying list.'
  end
  def collections(*)
    raise ::Spree::GraphQL::NotImplementedError
  end

  field :created_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description 'The date and time when the product was created.'
  end
  def created_at
    object.created_at
  end

  field :description, ::GraphQL::Types::String, null: true do
    description 'Description of the product.'
  end
  def description
    object.description
  end

  field :images, ::Spree::GraphQL::Schema::Types::Image.connection_type, null: false do
    description 'The product’s images.'
    argument :query,
             [Spree::GraphQL::Schema::Inputs::RansackQuery],
             required: false,
             default_value: [{ 'key' => 's', 'value' => 'position asc' }],
             description: 'List of Ransack queries, can be used to filter and sort the results.'
  end
  def images(query:)
    query = Spree::GraphQL::Schema::Inputs::RansackQuery.queries_to_ransack_query(query)
    object.images.ransack(query).result
  end

  field :master_variant, ::Spree::GraphQL::Schema::Types::Variant, null: false do
    description 'The product’s master variant.'
  end
  def master_variant
    object.master
  end
  delegate :master_variant, to: :lazy_resolver

  field :name, ::GraphQL::Types::String, null: false do
    description 'The product’s name.'
  end
  def name
    object.name
  end

  field :price, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description 'The date and time when the product was last modified.'
  end
  def price
    object.price_for(context[:helpers].current_pricing_options)
  end

  field :slug, ::GraphQL::Types::String, null: false do
    description 'A human-friendly unique string for the Product automatically generated from its title.'
  end
  def slug
    object.slug
  end

  field :updated_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description 'The date and time when the product was last modified.'
  end
  def updated_at
    object.updated_at
  end

  field :variants, ::Spree::GraphQL::Schema::Types::Variant.connection_type, null: false do
    description 'List of the product’s variants.'
    argument :including_master,
             ::GraphQL::Types::Boolean,
             required: false,
             default_value: false,
             description: 'Whether the returned variants should include the master variant or not.'
    argument :query,
             [Spree::GraphQL::Schema::Inputs::RansackQuery],
             required: false,
             default_value: [{ 'key' => 's', 'value' => 'position asc' }],
             description: 'List of Ransack queries, can be used to filter and sort the results.'
  end
  delegate :variants, to: :lazy_resolver
end
