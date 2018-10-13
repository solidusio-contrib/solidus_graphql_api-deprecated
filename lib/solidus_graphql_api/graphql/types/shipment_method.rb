module Spree
  module GraphQL
    class ShipmentMethodType < ::Types::BaseObject
       field :id, ID, null: false
       field  :name, String, null: false
    end
  end
end