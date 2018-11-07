class Spree::GraphQL::Schema::Types::DiscountApplicationAllocationMethod < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'DiscountApplicationAllocationMethod'
  description %q{The method by which the discount's value is allocated onto its entitled lines.}
  include ::Spree::GraphQL::Types::DiscountApplicationAllocationMethod
  value 'ACROSS', %q{The value is spread across all entitled lines.}
  value 'EACH', %q{The value is applied onto every entitled line.}
  value 'ONE', %q{The value is specifically applied onto a particular line.}
end