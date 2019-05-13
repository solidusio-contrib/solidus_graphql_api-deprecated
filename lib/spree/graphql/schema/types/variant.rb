# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::Variant < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'Variant'

  description <<~MD
    A product variant represents a different version of a product, such as differing sizes or differing colors.
  MD

  field :available_for_sale, ::GraphQL::Types::Boolean, null: false do
    description 'Indicates if the product variant is available for sale.'
  end
  def available_for_sale
    raise ::Spree::GraphQL::NotImplementedError
  end

  field :option_values, ::Spree::GraphQL::Schema::Types::OptionValue.connection_type, null: false do
    description 'The product variant’s option values.'
  end
  def option_values
    object.option_values.order(:position)
  end

  field :product, ::Spree::GraphQL::Schema::Types::Product, null: false do
    description 'The product object that the product variant belongs to.'
  end
  def product
    object.product
  end

  field :sku, ::GraphQL::Types::String, null: true do
    description 'The SKU (stock keeping unit) associated with the variant.'
  end
  def sku
    object.sku
  end

  field :title, ::GraphQL::Types::String, null: false do
    description 'The product variant’s title.'
  end
  def title
    object.name
  end

  field :weight, ::GraphQL::Types::Float, null: true do
    description 'The weight of the product variant in the unit system specified with `weight_unit`.'
  end
  def weight
    object.weight
  end
end
