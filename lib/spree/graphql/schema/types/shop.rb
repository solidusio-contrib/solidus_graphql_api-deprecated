# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::Shop < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'Shop'

  description %q{Shop represents a collection of the general settings and information about the shop.}

  field :collection_by_handle, ::Spree::GraphQL::Schema::Types::Collection, null: true do
    description %q{Find a collection by its handle.}
    argument :handle, ::GraphQL::Types::String, required: true, description: %q{The handle of the collection.}
  end
  def collection_by_handle(handle:)
    ::Spree::Taxon.find_by(permalink: handle)
  end

  field :collections, ::Spree::GraphQL::Schema::Types::Collection.connection_type, null: false do
    description %q{List of the shop’s collections.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
    argument :sort_key, ::Spree::GraphQL::Schema::Types::CollectionSortKeys, required: false, default_value: 'ID', description: %q{Sort the underlying list by the given key.}
    argument :query, ::GraphQL::Types::String, required: false, default_value: nil, description: %q{Supported filter parameters:
 - `title`
 - `collection_type`
 - `updated_at`

See the detailed [search syntax](https://help.solidus.io/api/getting-started/search-syntax).
}
  end
  def collections(reverse:, sort_key:, query:)
    if query
      raise ::Spree::GraphQL::NotImplementedError.new
    end

    ::Spree::GraphQL::Schema::Types::CollectionSortKeys.apply!(
      ::Spree::Taxonomy.all,
      reverse: reverse,
      sort_key: sort_key,
    )
  end

  field :description, ::GraphQL::Types::String, null: true do
    description %q{A description of the shop.}
  end
  def description
    object.meta_description || ''
  end

  field :money_format, ::GraphQL::Types::String, null: false do
    description %q{A string representing the way currency is formatted when the currency isn’t specified.}
  end
  def money_format
    format = ::Spree::Money.new(123456789, currency: Spree::Config.currency, no_cents: true).format
    format.sub! /1.+?9/, '{{amount}}'
    format
  end

  field :name, ::GraphQL::Types::String, null: false do
    description %q{The shop’s name.}
  end
  def name
    object.name
  end

  field :payment_settings, ::Spree::GraphQL::Schema::Types::PaymentSettings, null: false do
    description %q{Settings related to payments.}
  end
  def payment_settings
    OpenStruct.new(
      country_code: object.cart_tax_country_iso,
      currency_code: object.default_currency
      # acceptedCardBrands: [],
      # cardVaultUrl: '',
      # solidusPaymentsAccountId: '',
      # supportedDigitalWallets: '',
    )
  end

  field :primary_domain, ::Spree::GraphQL::Schema::Types::Domain, null: false do
    description %q{The shop’s primary domain.}
  end
  def primary_domain
    ::Spree::GraphQL::Domain.new(context[:current_store].url, Rails.configuration.force_ssl)
  end

  field :product_by_handle, ::Spree::GraphQL::Schema::Types::Product, null: true do
    description %q{Find a product by its handle.}
    argument :handle, ::GraphQL::Types::String, required: true, description: %q{The handle of the product.}
  end
  def product_by_handle(handle:)
    ::Spree::Product.find_by(slug: handle)
  end

  field :products, ::Spree::GraphQL::Schema::Types::Product.connection_type, null: false do
    description %q{List of the shop’s products.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
    argument :sort_key, ::Spree::GraphQL::Schema::Types::ProductSortKeys, required: false, default_value: 'ID', description: %q{Sort the underlying list by the given key.}
    argument :query, ::GraphQL::Types::String, required: false, default_value: nil, description: %q{Supported filter parameters:
 - `title`
 - `product_type`
 - `vendor`
 - `created_at`
 - `updated_at`
 - `variants.price`
 - `tag`

See the detailed [search syntax](https://help.solidus.io/api/getting-started/search-syntax).
}
  end
  def products(reverse:, sort_key:, query:)
    if query
      raise ::Spree::GraphQL::NotImplementedError.new
    end

    ::Spree::GraphQL::Schema::Types::ProductSortKeys.apply!(
      ::Spree::Product.all,
      reverse: reverse,
      sort_key: sort_key,
    )
  end

  field :ships_to_countries, [::Spree::GraphQL::Schema::Types::CountryCode], null: false do
    description %q{Countries that the shop ships to.}
  end
  def ships_to_countries
    context[:helpers].available_countries.map(&:iso)
  end
end
