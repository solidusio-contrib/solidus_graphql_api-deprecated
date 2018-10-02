module Solidus
  module GraphQL
   class VariantType < ::GraphQL::Schema::Object

    graphql_name "Variant"


      require_relative "./image_type"
      require_relative "./product_type"
      require_relative "./price_type"

      field :id, ID, null: true
      field :sku, String, null: true
      field :graphql_name, String, null: true
      field :weight, String, null: true
      field :height, String, null: true
      field :images, [ImageType, null: true], null: true

      field :price, PriceType, null: true

      def price
        options = OpenStruct.new({
          desired_attributes: {
            currency: 'USD'
          }
        })
        object.product.price_for(options)
      end

      field :product, ProductType, null: true, resolve:ProductResolver::ByVariant
    end
  end
end
