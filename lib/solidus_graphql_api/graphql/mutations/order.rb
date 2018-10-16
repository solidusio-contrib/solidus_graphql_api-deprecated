module Spree
  module GraphQL
    module Mutations
      module Order

        def find_order(order_token)
          Spree::Order.find_by_guest_token(order_token)
        end

        def find_variant(variant_id)
          Spree::Variant.find(variant_id)
        end

        class CreateOrder < ::Spree::GraphQL::Mutations::BaseMutation
          include Spree::GraphQL::Mutations::Order

          graphql_name 'CreateOrder'
          description 'Create an Order '

          argument :email, String, required: false


          field :order_token, String, null: true
          field :order, Types::Order, null: false
          field :errors, [String], null: false

          def resolve(email:)
            @order = Spree::Order.create!(user: context[:current_api_user], store: context[:current_store])
            if (@order.persisted?)
              {
                  order_token: @order.guest_token,
                  order: @order
              }
            else
              {
                  order_token: nil,
                  errors: @order.errors.full_messages

              }
            end
          end
        end

        class AddOrUpdateCartItem < ::Spree::GraphQL::Mutations::BaseMutation
          include Spree::GraphQL::Mutations::Order
          graphql_name 'AddOrUpdateCartItem'
          description 'Add or update an item'

          argument :variant_id, ID, required: true
          argument :quantity, Integer, required: true
          argument :order_token, String, required: false

          field :order, Types::Order, null: true
          field :line_item, Types::LineItem, null: true
          field :errors, [String], null: true

          def resolve(variant_id:, quantity:, order_token:)

            order = find_order(order_token)
            variant = find_variant(variant_id)
            line_item = order.contents.add(variant, quantity)
            if (line_item.persisted?)
              {
                  line_item: line_item

              }
            else
              {
                  errors: line_item.errors.full_messages

              }
            end
          end
        end

        class RemoveItemFromCart < ::Spree::GraphQL::Mutations::BaseMutation
          include Spree::GraphQL::Mutations::Order
          graphql_name 'AddItemToCart'
          argument :variant_id, ID, required: true
          argument :order_token, String, required: true
          argument :quantity, Integer, required: true

          field :order, Types::Order, null: false
          field :errors, [String], null: false
          field :line_item, Types::LineItem, null: true


          def resolve(variant_id:, quantity:, order_token:)
            order = find_order(order_token)
            variant = find_variant(variant_id)
            line_item = order.contents.remove(variant, quantity)
            if(line_item.errors.empty?)
              {
                  line_item: line_item
              }
            else
              {
                  errors: line_item.errors.full_messages
              }
            end
          end

        end

      end
    end
  end
end
