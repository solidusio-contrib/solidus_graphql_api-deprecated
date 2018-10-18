module Spree
  module GraphQL
    module Types
     class Variant < ::GraphQL::Schema::Object

        graphql_name 'Variant'

        require_relative './image'
        require_relative './product'
        require_relative './price'

        field :id, ID, null: true
        field :sku, String, null: true
        field :name, String, null: true
        field :weight, String, null: true
        field :height, String, null: true
        field :images, [Image, null: true], null: true

        field :price, Price, null: true

        def price
          options = OpenStruct.new({
            desired_attributes: {
              currency: 'USD'
            }
          })
          object.product.price_for(options)
        end

        field :product, Product, null: true, resolve: Resolvers::Product::ByVariant
      end
    end
  end
end
