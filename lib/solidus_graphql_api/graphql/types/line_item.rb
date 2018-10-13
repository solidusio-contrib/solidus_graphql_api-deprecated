require_relative './variant'
module Spree
  module GraphQL
    module Types
      class LineItem < BaseObject
        graphql_name 'LineItem'
        field :id, ID, null: false
        field :variant, Variant, null: false, resolve: Resolvers::Variant::ByLineItem
        field :quantity, String, null: false
      end
    end
  end
end
