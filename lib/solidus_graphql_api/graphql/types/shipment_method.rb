module Spree
  module GraphQL
    module Types
      class ShipmentMethod < BaseObject
        field :id, ID, null: false
        field :name, String, null: false
      end
    end
  end
end
