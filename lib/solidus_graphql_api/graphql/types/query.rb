module Spree
  module GraphQL
    module Types
      class Query < BaseObject

        field :products, [Product], null: true, resolve: ProductResolver::All do
          description 'Products'
        end

        field :shipping_methods, [ShipmentMethod], null: true, resolve: ShipmentMethodResolver::All do
          description 'Shipping Methods'
        end

        field :payment_methods, [PaymentMethod], null: true, resolve: PaymentMethodResolver::All do
          description 'Payment Methods'
        end
      end
    end
  end
end
