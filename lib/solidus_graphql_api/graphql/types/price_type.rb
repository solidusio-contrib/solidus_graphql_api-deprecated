module Solidus
  module GraphQL
    class PriceType < Types::BaseObject
      graphql_name "Price"

      field :amount, Float, null: true

      def amount
        object.money.fractional.to_f / object.money.currency.subunit_to_unit
      end

      field :subunit_amount, Integer, null: true

      def subunit_amount
        object.money.fractional
      end

      field :currency, CurrencyType, null: true

      def currency
        object.money.currency
      end
    end
  end
end
