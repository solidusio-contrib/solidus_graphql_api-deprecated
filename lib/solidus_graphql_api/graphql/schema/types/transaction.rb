class Spree::GraphQL::Schema::Types::Transaction < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'Transaction'
  description %q{An object representing exchange of money for a product or service.}
  include ::Spree::GraphQL::Types::Transaction
  field :amount, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description %q{The amount of money that the transaction was for.}
  end
  field :kind, ::Spree::GraphQL::Schema::Types::TransactionKind, null: false do
    description %q{The kind of the transaction.}
  end
  field :status, ::Spree::GraphQL::Schema::Types::TransactionStatus, null: false do
    description %q{The status of the transaction}
  end
  field :test, ::GraphQL::Types::Boolean, null: false do
    description %q{Whether the transaction was done in test mode or not}
  end
end