module Spree
  module GraphQL
    module Types
      class Price < BaseObject
        graphql_name 'Price'

        field :amount, Float, null: true

        def amount
          object.money.fractional.to_f / object.money.currency.subunit_to_unit
        end

        field :subunit_amount, Integer, null: true

        def subunit_amount
          object.money.fractional
        end

        field :currency, Currency, null: true

        def currency
          object.money.currency
        end
      end
    end
  end
end
