module Spree::GraphQL::Schema::Interfaces::Node
  include ::Spree::GraphQL::Schema::Interfaces::BaseInterface
  graphql_name 'Node'
  description %q{An object with an ID to support global identification.}
  include ::Spree::GraphQL::Interfaces::Node
  definition_methods do
  end

  field :id, 'ID', null: false, resolve: GraphQL::Relay::GlobalIdResolve.new(type: self)
end
