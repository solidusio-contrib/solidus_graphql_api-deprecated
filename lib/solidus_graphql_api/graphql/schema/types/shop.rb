class Spree::GraphQL::Schema::Types::Shop < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'Shop'
  description %q{Shop represents a collection of the general settings and information about the shop.}

  
  include ::Spree::GraphQL::Types::Shop

  field :description, ::GraphQL::Types::String, null: true do
    description %q{A description of the shop.}
  end
  field :name, ::GraphQL::Types::String, null: false do
    description %q{The shop’s name.}
  end
end
