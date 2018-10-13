module Spree
  module GraphQL
    class ShipmentMethodResolver
      class All
        def self.call(obj, args, ctx)
          Spree::ShippingMethod.all
        end
      end
    end
  end
end
