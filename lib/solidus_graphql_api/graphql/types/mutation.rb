module Spree
  module GraphQL
    module Types
      class Mutation < BaseObject
        field :create_order, mutation: ::Spree::GraphQL::Mutations::Order::CreateOrder
        field :add_or_update_item, mutation: ::Spree::GraphQL::Mutations::Order::AddOrUpdateCartItem
        field :remove_item, mutation: ::Spree::GraphQL::Mutations::Order::RemoveItemFromCart
      end
    end
  end
end
