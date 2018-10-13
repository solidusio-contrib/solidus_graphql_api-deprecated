module Spree
  module GraphQL
    class QueryType < ::Types::BaseObject


      field :products, [ProductType], null: true, resolve: ProductResolver::All  do
        description "Find products"
      end

     field :shipping_methods, [ShipmentMethodType], null: true, resolve: ShipmentMethodResolver::All do
       description "Shipping Methods"
     end


      field :payment_methods, [PaymentMethodType], null: true, resolve: PaymentMethodResolver::All do
        description "Payment Methods"
      end

    end
  end
end


