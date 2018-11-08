class Spree::GraphQL::Schema::Types::BaseObjectNode < GraphQL::Schema::Object
  include ::Spree::GraphQL::Types::BaseObject
  global_id_field :id
  implements ::GraphQL::Relay::Node.interface
end
