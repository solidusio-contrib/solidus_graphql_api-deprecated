# frozen_string_literal: true
module Spree::GraphQL::Types::Customer

  # acceptsMarketing: Indicates whether the customer has consented to be sent marketing material via email.
  # @return [Types::Boolean!]
  def accepts_marketing()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # addresses: A list of addresses for the customer.
  # @param reverse [Types::Boolean] (false) Reverse the order of the underlying list.
  # @return [Types::MailingAddress.connection_type!]
  def addresses(reverse:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # createdAt: The date and time when the customer was created.
  # @return [Types::DateTime!]
  def created_at()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # defaultAddress: The customer’s default address.
  # @return [Types::MailingAddress]
  def default_address()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # displayName: The customer’s name, email or phone number.
  # @return [Types::String!]
  def display_name()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # email: The customer’s email address.
  # @return [Types::String]
  def email()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # firstName: The customer’s first name.
  # @return [Types::String]
  def first_name()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # id: A unique identifier for the customer.
  # @return [Types::ID!]
  def id()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # lastIncompleteCheckout: The customer's most recently updated, incomplete checkout.
  # @return [Types::Checkout]
  def last_incomplete_checkout()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # lastName: The customer’s last name.
  # @return [Types::String]
  def last_name()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # orders: The orders associated with the customer.
  # @param reverse [Types::Boolean] (false) Reverse the order of the underlying list.
  # @param sort_key [Types::OrderSortKeys] ('ID') Sort the underlying list by the given key.
  # @param query [Types::String] Supported filter parameters:  - `processed_at` See the detailed [search syntax](https://help.solidus.io/api/getting-started/search-syntax).
  # @return [Types::Order.connection_type!]
  def orders(reverse:, sort_key:, query:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # phone: The customer’s phone number.
  # @return [Types::String]
  def phone()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # updatedAt: The date and time when the customer information was updated.
  # @return [Types::DateTime!]
  def updated_at()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end