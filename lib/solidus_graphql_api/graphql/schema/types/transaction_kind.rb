class Spree::GraphQL::Schema::Types::TransactionKind < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'TransactionKind'
  description nil
  include ::Spree::GraphQL::Types::TransactionKind
  value 'SALE', nil
  value 'CAPTURE', nil
  value 'AUTHORIZATION', nil
  value 'EMV_AUTHORIZATION', nil
  value 'CHANGE', nil
end