class Spree::GraphQL::Schema::Types::ShopPolicy < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'ShopPolicy'
  description %q{Policy that a merchant has configured for their store, such as their refund or privacy policy.}
  include ::Spree::GraphQL::Types::ShopPolicy
  field :body, ::GraphQL::Types::String, null: false do
    description %q{Policy text, maximum size of 64kb.}
  end
  field :id, ::GraphQL::Types::ID, null: false do
    description %q{Globally unique identifier.}
  end
  field :title, ::GraphQL::Types::String, null: false do
    description %q{Policy’s title.}
  end
  field :url, ::Spree::GraphQL::Schema::Types::URL, null: false do
    description %q{Public URL to the policy.}
  end
end
