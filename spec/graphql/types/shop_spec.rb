require 'spec_helper'

describe 'Types' do
  describe 'Shop' do
    let!(:shop) {create(:store)}

    # Field: collectionByHandle: Find a collection by its handle.
    # Args: handle : Types::String!
    # Returns: Types::Collection
    #it 'collection_by_handle' do
    #  query = <<-GRAPHQL
    #    { shop { collectionByHandle(handle:) }}
    #  GRAPHQL
    #  response = ::Spree::GraphQL::Schema::Schema.execute(query)
    #  result = response.dig('data', 'shop')
    #  expect(result['collectionByHandle']).to eq shop.collection_by_handle
    #end

    # Field: collections: List of the shop’s collections.
    # Args: reverse : Types::Boolean = false, sort_key : Types::CollectionSortKeys = 'ID', query : Types::String
    # Returns: Types::Collection.connection_type!
    #it 'collections' do
    #  query = <<-GRAPHQL
    #    { shop { collections(reverse:, sort_key:, query:) }}
    #  GRAPHQL
    #  response = ::Spree::GraphQL::Schema::Schema.execute(query)
    #  result = response.dig('data', 'shop')
    #  expect(result['collections']).to eq shop.collections
    #end

    # Field: description: A description of the shop.
    # Args: 
    # Returns: Types::String
    it 'description' do
      shop.meta_description = 'Shop Description'
      shop.save
      query = <<-GRAPHQL
        { shop { description() }}
      GRAPHQL
      response = ::Spree::GraphQL::Schema::Schema.execute(query)
      result = response.dig('data', 'shop')
      expect(result['description']).to eq shop.meta_description
    end

    # Field: moneyFormat: A string representing the way currency is formatted when the currency isn’t specified.
    # Args: 
    # Returns: Types::String!
    #it 'money_format' do
    #  query = <<-GRAPHQL
    #    { shop { moneyFormat() }}
    #  GRAPHQL
    #  response = ::Spree::GraphQL::Schema::Schema.execute(query)
    #  result = response.dig('data', 'shop')
    #  expect(result['moneyFormat']).to eq shop.money_format
    #end

    # Field: name: The shop’s name.
    # Args: 
    # Returns: Types::String!
    it 'name' do
      query = <<-GRAPHQL
        { shop { name() }}
      GRAPHQL
      response = ::Spree::GraphQL::Schema::Schema.execute(query)
      result = response.dig('data', 'shop')
      expect(result['name']).to eq shop.name
    end

    # Field: paymentSettings: Settings related to payments.
    # Args: 
    # Returns: Types::PaymentSettings!
    #it 'payment_settings' do
    #  query = <<-GRAPHQL
    #    { shop { paymentSettings() }}
    #  GRAPHQL
    #  response = ::Spree::GraphQL::Schema::Schema.execute(query)
    #  result = response.dig('data', 'shop')
    #  expect(result['paymentSettings']).to eq shop.payment_settings
    #end

    # Field: primaryDomain: The shop’s primary domain.
    # Args: 
    # Returns: Types::Domain!
    #it 'primary_domain' do
    #  query = <<-GRAPHQL
    #    { shop { primaryDomain() }}
    #  GRAPHQL
    #  response = ::Spree::GraphQL::Schema::Schema.execute(query)
    #  result = response.dig('data', 'shop')
    #  expect(result['primaryDomain']).to eq shop.primary_domain
    #end

    # Field: privacyPolicy: The shop’s privacy policy.
    # Args: 
    # Returns: Types::ShopPolicy
    #it 'privacy_policy' do
    #  query = <<-GRAPHQL
    #    { shop { privacyPolicy() }}
    #  GRAPHQL
    #  response = ::Spree::GraphQL::Schema::Schema.execute(query)
    #  result = response.dig('data', 'shop')
    #  expect(result['privacyPolicy']).to eq shop.privacy_policy
    #end

    # Field: productByHandle: Find a product by its handle.
    # Args: handle : Types::String!
    # Returns: Types::Product
    #it 'product_by_handle' do
    #  query = <<-GRAPHQL
    #    { shop { productByHandle(handle:) }}
    #  GRAPHQL
    #  response = ::Spree::GraphQL::Schema::Schema.execute(query)
    #  result = response.dig('data', 'shop')
    #  expect(result['productByHandle']).to eq shop.product_by_handle
    #end

    # Field: productTypes: List of the shop’s product types.
    # Args: 
    # Returns: Types::String.connection_type!
    #it 'product_types' do
    #  query = <<-GRAPHQL
    #    { shop { productTypes() }}
    #  GRAPHQL
    #  response = ::Spree::GraphQL::Schema::Schema.execute(query)
    #  result = response.dig('data', 'shop')
    #  expect(result['productTypes']).to eq shop.product_types
    #end

    # Field: products: List of the shop’s products.
    # Args: reverse : Types::Boolean = false, sort_key : Types::ProductSortKeys = 'ID', query : Types::String
    # Returns: Types::Product.connection_type!
    #it 'products' do
    #  query = <<-GRAPHQL
    #    { shop { products(reverse:, sort_key:, query:) }}
    #  GRAPHQL
    #  response = ::Spree::GraphQL::Schema::Schema.execute(query)
    #  result = response.dig('data', 'shop')
    #  expect(result['products']).to eq shop.products
    #end

    # Field: refundPolicy: The shop’s refund policy.
    # Args: 
    # Returns: Types::ShopPolicy
    #it 'refund_policy' do
    #  query = <<-GRAPHQL
    #    { shop { refundPolicy() }}
    #  GRAPHQL
    #  response = ::Spree::GraphQL::Schema::Schema.execute(query)
    #  result = response.dig('data', 'shop')
    #  expect(result['refundPolicy']).to eq shop.refund_policy
    #end

    # Field: shipsToCountries: Countries that the shop ships to.
    # Args: 
    # Returns: [Types::CountryCode!]!
    #it 'ships_to_countries' do
    #  query = <<-GRAPHQL
    #    { shop { shipsToCountries() }}
    #  GRAPHQL
    #  response = ::Spree::GraphQL::Schema::Schema.execute(query)
    #  result = response.dig('data', 'shop')
    #  expect(result['shipsToCountries']).to eq shop.ships_to_countries
    #end

    # Field: termsOfService: The shop’s terms of service.
    # Args: 
    # Returns: Types::ShopPolicy
    #it 'terms_of_service' do
    #  query = <<-GRAPHQL
    #    { shop { termsOfService() }}
    #  GRAPHQL
    #  response = ::Spree::GraphQL::Schema::Schema.execute(query)
    #  result = response.dig('data', 'shop')
    #  expect(result['termsOfService']).to eq shop.terms_of_service
    #end

  end
end

