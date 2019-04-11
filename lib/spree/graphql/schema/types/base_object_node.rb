# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::BaseObjectNode < GraphQL::Schema::Object
  global_id_field :id
  implements ::GraphQL::Relay::Node.interface
end
