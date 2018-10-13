module Spree
  module GraphQL
    module Resolvers
      class ShipmentMethod
        class All
          def self.call(obj, args, ctx)
            Spree::ShippingMethod.all
          end
        end
      end
    end
  end
end
