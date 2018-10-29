class Spree::GraphQL::Schema::Types::Attribute < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'Attribute'
  description %q{Represents a generic custom attribute.}
  include ::Spree::GraphQL::Types::Attribute
  field :key, ::GraphQL::Types::String, null: false do
    description %q{Key or name of the attribute.}
  end
  field :value, ::GraphQL::Types::String, null: true do
    description %q{Value of the attribute.}
  end
end