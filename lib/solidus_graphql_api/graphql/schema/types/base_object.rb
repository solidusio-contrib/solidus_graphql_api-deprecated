class Spree::GraphQL::Schema::Types::BaseObject < GraphQL::Schema::Object
  global_id_field :id
  include ::Spree::GraphQL::Types::BaseObject
end