module Solidus
  module GraphQL

    class OrderResolver
      class FromPayment
        def self.call(obj, args,ctx)
          Spree::Order.find(obj.order_id)
        end
      end
    end
  end
end