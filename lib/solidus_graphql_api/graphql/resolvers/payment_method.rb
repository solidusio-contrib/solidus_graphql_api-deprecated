module Spree
  module GraphQL
    module Resolvers
      class PaymentMethod
        class All
          def self.call(obj, args, ctx)
            Spree::PaymentMethod.all
          end
        end
      end
    end
  end
end
