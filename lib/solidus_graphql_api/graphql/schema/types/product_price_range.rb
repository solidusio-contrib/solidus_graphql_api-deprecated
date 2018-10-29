class Spree::GraphQL::Schema::Types::ProductPriceRange < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'ProductPriceRange'
  description %q{The price range of the product.}
  include ::Spree::GraphQL::Types::ProductPriceRange
  field :max_variant_price, ::Spree::GraphQL::Schema::Types::MoneyV2, null: false do
    description %q{The highest variant's price.}
  end
  field :min_variant_price, ::Spree::GraphQL::Schema::Types::MoneyV2, null: false do
    description %q{The lowest variant's price.}
  end
end