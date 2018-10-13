require_relative 'variant_type'
module Spree
  module GraphQL
    class LineItemType < Types::BaseObject
      graphql_name "LineItem"
      field :id, ID, null: false
      field :variant, VariantType, null: false, resolve: VariantResolver::ByLineItem
      field :quantity, String, null: false
    end
  end
end
