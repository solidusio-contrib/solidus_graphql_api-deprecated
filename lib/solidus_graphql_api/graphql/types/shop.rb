# frozen_string_literal: true
module Spree::GraphQL::Types::Shop

  # collectionByHandle: Find a collection by its handle.
  # @param handle [Types::String!] The handle of the collection.
  # @return [Types::Collection]
  def collection_by_handle(handle:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # collections: List of the shop’s collections.
  # @param reverse [Types::Boolean] (false) Reverse the order of the underlying list.
  # @param sort_key [Types::CollectionSortKeys] ('ID') Sort the underlying list by the given key.
  # @param query [Types::String] Supported filter parameters:  - `title`  - `collection_type`  - `updated_at` See the detailed [search syntax](https://help.solidus.io/api/getting-started/search-syntax).
  # @return [Types::Collection.connection_type!]
  def collections(reverse:, sort_key:, query:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # description: A description of the shop.
  # @return [Types::String]
  def description()
    object.meta_description
  end

  # moneyFormat: A string representing the way currency is formatted when the currency isn’t specified.
  # @return [Types::String!]
  def money_format()
    format = ::Spree::Money.new(123456789, currency: Spree::Config.currency, no_cents: true).format
    format.sub! /1.+?9/, '{{amount}}'
    format
  end

  # name: The shop’s name.
  # @return [Types::String!]
  def name()
    object.name
  end

  # paymentSettings: Settings related to payments.
  # @return [Types::PaymentSettings!]
  def payment_settings()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # primaryDomain: The shop’s primary domain.
  # @return [Types::Domain!]
  def primary_domain()
    ::Spree::Domain.new(context[:current_store].url, Rails.configuration.force_ssl)
  end

  # privacyPolicy: The shop’s privacy policy.
  # @return [Types::ShopPolicy]
  def privacy_policy()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # productByHandle: Find a product by its handle.
  # @param handle [Types::String!] The handle of the product.
  # @return [Types::Product]
  def product_by_handle(handle:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # productTypes: List of the shop’s product types.
  # @return [Types::String.connection_type!]
  def product_types()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # products: List of the shop’s products.
  # @param reverse [Types::Boolean] (false) Reverse the order of the underlying list.
  # @param sort_key [Types::ProductSortKeys] ('ID') Sort the underlying list by the given key.
  # @param query [Types::String] Supported filter parameters:  - `title`  - `product_type`  - `vendor`  - `created_at`  - `updated_at`  - `variants.price`  - `tag` See the detailed [search syntax](https://help.solidus.io/api/getting-started/search-syntax).
  # @return [Types::Product.connection_type!]
  def products(reverse:, sort_key:, query:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # refundPolicy: The shop’s refund policy.
  # @return [Types::ShopPolicy]
  def refund_policy()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # shipsToCountries: Countries that the shop ships to.
  # @return [[Types::CountryCode!]!]
  def ships_to_countries()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # termsOfService: The shop’s terms of service.
  # @return [Types::ShopPolicy]
  def terms_of_service()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end
