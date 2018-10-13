module Spree
  module GraphQL
    module Types
      class Product < BaseObject
        graphql_name 'Product'
        global_id_field :id
        require_relative './variant'

        field :id, ID, null: true
        field :name, String, null: true
        field :description, String, null: true
        field :master, Variant, null: true
        field :slug, String, null: true
        field :images, [Image, null: true], null: true
        field :option_types, Option.connection_type, null: true

        field :variants, Variant.connection_type, null: true, resolve: VariantResolver::ByProduct

        field :option_values_by_option_type, OptionValue.connection_type, null: true, resolve: ProductResolver::OptionValues
      end
    end
  end
end
