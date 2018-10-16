module Spree
  module GraphQL
    module Resolvers
      class Payments
        class ByOrderId
          def self.call(obj,args,ctx)
            Spree::Payment.find_by_id(obj.order_id)
          end
        end
      end
    end
  end
end
