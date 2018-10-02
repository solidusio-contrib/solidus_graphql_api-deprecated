module Solidus
  module GraphQL
    class PaymentType < Types::BaseObject
      graphql_name "Payment"
      require_relative "./order_type"


      field :id, ID, null: false
      field :amount, Float, null: true
      field :state, String, null: false
      field :order, OrderType, null: false,  resolve: OrderResolver::FromPayment
      field :source_id, ID, null: false
      field :source_type, String, null: false
      field :payment_method_id, ID, null: false
      field :avs_response, String, null: false
      field :cvv_response_code, String, null: false
      field :cvv_response_message, String, null: false
    end
  end
end