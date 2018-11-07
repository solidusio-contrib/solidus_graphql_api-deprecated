# frozen_string_literal: true
module Spree::GraphQL::Types::CreditCard

  # brand
  # @return [Types::String]
  def brand()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # expiryMonth
  # @return [Types::Int]
  def expiry_month()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # expiryYear
  # @return [Types::Int]
  def expiry_year()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # firstDigits
  # @return [Types::String]
  def first_digits()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # firstName
  # @return [Types::String]
  def first_name()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # lastDigits
  # @return [Types::String]
  def last_digits()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # lastName
  # @return [Types::String]
  def last_name()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # maskedNumber: Masked credit card number with only the last 4 digits displayed
  # @return [Types::String]
  def masked_number()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end