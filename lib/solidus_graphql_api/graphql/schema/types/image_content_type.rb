class Spree::GraphQL::Schema::Types::ImageContentType < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'ImageContentType'
  description %q{List of supported image content types.}
  include ::Spree::GraphQL::Types::ImageContentType
  value 'PNG', nil
  value 'JPG', nil
  value 'WEBP', nil
end