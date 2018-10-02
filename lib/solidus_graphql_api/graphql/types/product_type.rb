module Solidus
  module GraphQL
    class ProductType < ::Types::BaseObject
      graphql_name "Product"
      global_id_field :id
      require_relative './variant_type'

      field :id, ID, null: true
      field :name, String, null: true
      field :description, String, null: true
      field :master, VariantType, null: true
      field :slug, String, null: true
      field :images, [ImageType, null: true], null: true
      field :option_types, OptionType.connection_type, null: true

      field :variants, VariantType.connection_type, null: true, resolve: VariantResolver::ByProduct

      field :option_values_by_option_type, OptionValueType.connection_type, null: true, resolve: ProductResolver::OptionValues
    end
  end
end
