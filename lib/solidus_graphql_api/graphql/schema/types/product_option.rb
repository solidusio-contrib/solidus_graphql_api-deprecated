class Spree::GraphQL::Schema::Types::ProductOption < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'ProductOption'
  description %q{Custom product property names like "Size", "Color", and "Material".
Products are based on permutations of these options.
A product may have a maximum of 3 options.
255 characters limit each.
}
  implements ::Spree::GraphQL::Schema::Interfaces::Node
  include ::Spree::GraphQL::Types::ProductOption
  field :id, ::GraphQL::Types::ID, null: false do
    description %q{Globally unique identifier.}
  end
  field :name, ::GraphQL::Types::String, null: false do
    description %q{The product option’s name.}
  end
  field :values, [::GraphQL::Types::String], null: false do
    description %q{The corresponding value to the product option name.}
  end
end