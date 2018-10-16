module Spree
  module GraphQL
    module Types
      class Query < BaseObject

        field :products, [Product], null: true, resolve: Resolvers::Product::All do
          description 'Products'
        end

        field :shipping_methods, [ShipmentMethod], null: true, resolve: Resolvers::ShipmentMethod::All do
          description 'Shipping Methods'
        end

        field :payment_methods, [PaymentMethod], null: true, resolve: Resolvers::PaymentMethod::All do
          description 'Payment Methods'
        end
      end
    end
  end
end
