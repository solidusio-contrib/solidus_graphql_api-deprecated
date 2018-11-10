class Spree::GraphQL::Schema::Types::Shop < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'Shop'
  description %q{Shop represents a collection of the general settings and information about the shop.}
  include ::Spree::GraphQL::Types::Shop
  field :collection_by_handle, ::Spree::GraphQL::Schema::Types::Collection, null: true do
    description %q{Find a collection by its handle.}
    argument :handle, ::GraphQL::Types::String, required: true, description: %q{The handle of the collection.}
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
  field :description, ::GraphQL::Types::String, null: true do
    description %q{A description of the shop.}
  end
  field :money_format, ::GraphQL::Types::String, null: false do
    description %q{A string representing the way currency is formatted when the currency isn’t specified.}
  end
  field :name, ::GraphQL::Types::String, null: false do
    description %q{The shop’s name.}
  end
  field :payment_settings, ::Spree::GraphQL::Schema::Types::PaymentSettings, null: false do
    description %q{Settings related to payments.}
  end
  field :primary_domain, ::Spree::GraphQL::Schema::Types::Domain, null: false do
    description %q{The shop’s primary domain.}
  end
  field :privacy_policy, ::Spree::GraphQL::Schema::Types::ShopPolicy, null: true do
    description %q{The shop’s privacy policy.}
  end
  field :product_by_handle, ::Spree::GraphQL::Schema::Types::Product, null: true do
    description %q{Find a product by its handle.}
    argument :handle, ::GraphQL::Types::String, required: true, description: %q{The handle of the product.}
  end
  field :product_types, ::GraphQL::Types::String.connection_type, null: false do
    description %q{List of the shop’s product types.}
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
  field :refund_policy, ::Spree::GraphQL::Schema::Types::ShopPolicy, null: true do
    description %q{The shop’s refund policy.}
  end
  field :ships_to_countries, [::Spree::GraphQL::Schema::Types::CountryCode], null: false do
    description %q{Countries that the shop ships to.}
  end
  field :terms_of_service, ::Spree::GraphQL::Schema::Types::ShopPolicy, null: true do
    description %q{The shop’s terms of service.}
  end
end
