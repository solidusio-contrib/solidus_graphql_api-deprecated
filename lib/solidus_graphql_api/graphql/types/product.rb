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
        field :option_types, [Option], null: true, resolve: Resolvers::Product::OptionTypes

        field :variants, [Variant], null: true, resolve: Resolvers::Product::Variants

        field :option_values_by_option_type, [OptionValue], null: true, resolve: Resolvers::Product::OptionValues
      end
    end
  end
end
