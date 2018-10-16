module Spree
  module GraphQL
    module Resolvers
      class Order
        class FromPayment
          def self.call(obj, args,ctx)
            Spree::Order.find(obj.order_id)
          end
        end
      end
    end
  end
end
