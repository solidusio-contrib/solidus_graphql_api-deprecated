module Spree
  module GraphQL
    module Types
      class Payment < BaseObject
        graphql_name 'Payment'
        require_relative './order'

        field :id, ID, null: false
        field :amount, Float, null: true
        field :state, String, null: false
        field :order, Order, null: false,  resolve: Resolvers::Order::FromPayment
        field :source_id, ID, null: false
        field :source_type, String, null: false
        field :payment_method_id, ID, null: false
        field :avs_response, String, null: false

        field :cvv_response_code, String, null: false
        field :cvv_response_message, String, null: false
      end
    end
  end
end
