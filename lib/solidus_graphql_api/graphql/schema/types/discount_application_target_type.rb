class Spree::GraphQL::Schema::Types::DiscountApplicationTargetType < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'DiscountApplicationTargetType'
  description %q{The type of line (i.e. line item or shipping line) on an order that the discount is applicable towards.
}
  include ::Spree::GraphQL::Types::DiscountApplicationTargetType
  value 'LINE_ITEM', %q{The discount applies onto line items.}
  value 'SHIPPING_LINE', %q{The discount applies onto shipping lines.}
end