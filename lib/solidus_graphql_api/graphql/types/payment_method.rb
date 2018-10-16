module Spree
  module GraphQL
    module Types
      class PaymentMethod < BaseObject
        field :id, ID, null: false
        field :type, String, null: false
        field :name, String, null: true
        field :description, String, null: true
        field :active, Boolean, null: false
        field :position, Integer, null: false
      end
    end
  end
end
