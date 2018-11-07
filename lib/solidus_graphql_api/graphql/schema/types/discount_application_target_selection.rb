class Spree::GraphQL::Schema::Types::DiscountApplicationTargetSelection < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'DiscountApplicationTargetSelection'
  description %q{Which lines on the order that the discount is allocated over, of the type
defined by the Discount Application's target_type.
}
  include ::Spree::GraphQL::Types::DiscountApplicationTargetSelection
  value 'ALL', %q{The discount is allocated onto all the lines.}
  value 'ENTITLED', %q{The discount is allocated onto only the lines it is entitled for.}
  value 'EXPLICIT', %q{The discount is allocated onto explicitly chosen lines.}
end