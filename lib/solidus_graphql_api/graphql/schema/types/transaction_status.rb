class Spree::GraphQL::Schema::Types::TransactionStatus < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'TransactionStatus'
  description nil
  include ::Spree::GraphQL::Types::TransactionStatus
  value 'PENDING', nil
  value 'SUCCESS', nil
  value 'FAILURE', nil
  value 'ERROR', nil
end