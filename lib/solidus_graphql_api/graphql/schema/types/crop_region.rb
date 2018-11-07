class Spree::GraphQL::Schema::Types::CropRegion < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'CropRegion'
  description %q{The part of the image that should remain after cropping.}
  include ::Spree::GraphQL::Types::CropRegion
  value 'CENTER', %q{Keep the center of the image}
  value 'TOP', %q{Keep the top of the image}
  value 'BOTTOM', %q{Keep the bottom of the image}
  value 'LEFT', %q{Keep the left of the image}
  value 'RIGHT', %q{Keep the right of the image}
end