class Spree::GraphQL::Schema::Types::WeightUnit < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'WeightUnit'
  description %q{Units of measurement for weight.}
  include ::Spree::GraphQL::Types::WeightUnit
  value 'KILOGRAMS', %q{1 kilogram equals 1000 grams.}
  value 'GRAMS', %q{Metric system unit of mass.}
  value 'POUNDS', %q{1 pound equals 16 ounces.}
  value 'OUNCES', %q{Imperial system unit of mass.}
end