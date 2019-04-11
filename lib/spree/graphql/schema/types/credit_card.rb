# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::CreditCard < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'CreditCard'

  description %q{Credit card information used for a payment.}

  field :brand, ::GraphQL::Types::String, null: true
  def brand
    object.brand.upcase
  end

  field :expiry_month, ::GraphQL::Types::Int, null: true
  def expiry_month
    object.month
  end

  field :expiry_year, ::GraphQL::Types::Int, null: true
  def expiry_year
    object.year
  end

  field :first_digits, ::GraphQL::Types::String, null: true
  def first_digits
    raise ::Spree::GraphQL::NotImplementedError
  end

  field :first_name, ::GraphQL::Types::String, null: true
  def first_name
    object.first_name
  end

  field :last_digits, ::GraphQL::Types::String, null: true
  def last_digits
    object.last_digits
  end

  field :last_name, ::GraphQL::Types::String, null: true
  def last_name
    object.last_name
  end

  field :masked_number, ::GraphQL::Types::String, null: true do
    description %q{Masked credit card number with only the last 4 digits displayed}
  end
  def masked_number
    object.display_number
  end
end
