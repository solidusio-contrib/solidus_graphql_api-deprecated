module Solidus
  module GraphQL
    class MutationType < ::Types::BaseObject
      field :create_order, mutation: ::Solidus::GraphQL::Mutations::Order::CreateOrder
      field :add_or_update_item, mutation: ::Solidus::GraphQL::Mutations::Order::AddOrUpdateCartItem
      field :remove_item, mutation: ::Solidus::GraphQL::Mutations::Order::RemoveItemFromCart
    end
  end
end
