class Spree::GraphQL::Schema::Types::CreditCard < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'CreditCard'
  description %q{Credit card information used for a payment.}
  include ::Spree::GraphQL::Types::CreditCard
  field :brand, ::GraphQL::Types::String, null: true do
    description nil
  end
  field :expiry_month, ::GraphQL::Types::Int, null: true do
    description nil
  end
  field :expiry_year, ::GraphQL::Types::Int, null: true do
    description nil
  end
  field :first_digits, ::GraphQL::Types::String, null: true do
    description nil
  end
  field :first_name, ::GraphQL::Types::String, null: true do
    description nil
  end
  field :last_digits, ::GraphQL::Types::String, null: true do
    description nil
  end
  field :last_name, ::GraphQL::Types::String, null: true do
    description nil
  end
  field :masked_number, ::GraphQL::Types::String, null: true do
    description %q{Masked credit card number with only the last 4 digits displayed}
  end
end