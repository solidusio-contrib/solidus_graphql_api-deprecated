module Solidus
  module GraphQL
    class AddressResolver


      class ByShipId
        def self.call(obj, args, ctx)
          Spree::Address.find(obj.ship_address_id)
        end
      end

      class ByBillId
        def self.call(obj, args, ctx)
          Spree::Address.find(obj.bill_address_id)
        end
      end
    end
  end
end