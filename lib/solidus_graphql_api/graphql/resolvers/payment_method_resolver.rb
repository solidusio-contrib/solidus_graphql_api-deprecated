module Spree
  module GraphQL
    class PaymentMethodResolver
      class All
        def self.call(obj, args, ctx)
          Spree::PaymentMethod.all
        end
      end
    end
  end
end