class Spree::GraphQL::Schema::Schema < GraphQL::Schema
  query ::Spree::GraphQL::Schema::Types::QueryRoot
  mutation ::Spree::GraphQL::Schema::Types::Mutation

  def self.id_from_object(object, type_definition, query_context)
    ::GraphQL::Schema::UniqueWithinType.encode(object.class.name, object.id)
  end

  def self.object_from_id(id, query_context)
    class_name, item_id = ::GraphQL::Schema::UniqueWithinType.decode(id)
    ::Object.const_get(class_name).find(item_id)
  end
end