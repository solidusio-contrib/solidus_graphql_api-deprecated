# frozen_string_literal: true
module Spree::GraphQL::Types::CreditCard

  # brand
  # @return [Types::String]
  def brand()
    object.brand.upcase
  end

  # expiryMonth
  # @return [Types::Int]
  def expiry_month()
    object.month
  end

  # expiryYear
  # @return [Types::Int]
  def expiry_year()
    object.year
  end

  # firstDigits
  # @return [Types::String]
  def first_digits()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # firstName
  # @return [Types::String]
  def first_name()
    object.first_name
  end

  # lastDigits
  # @return [Types::String]
  def last_digits()
    object.last_digits
  end

  # lastName
  # @return [Types::String]
  def last_name()
    object.last_name
  end

  # maskedNumber: Masked credit card number with only the last 4 digits displayed
  # @return [Types::String]
  def masked_number()
    object.display_number
  end
end
