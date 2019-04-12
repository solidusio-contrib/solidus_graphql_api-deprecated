# frozen_string_literal: true

require 'graphql'
require 'ostruct'

class Spree::GraphQL::Schema < ::GraphQL::Schema
  query ::Spree::GraphQL::Schema::Types::QueryRoot
  mutation ::Spree::GraphQL::Schema::Types::Mutation

  def self.id_from_object(object, _type_definition = nil, _query_context = nil)
    ::GraphQL::Schema::UniqueWithinType.encode(object.class.name, object.id)
  end

  def self.object_from_id(id, _query_context = nil)
    class_name, item_id = ::GraphQL::Schema::UniqueWithinType.decode(id)
    ::Object.const_get(class_name).find(item_id)
  end

  def self.resolve_type(_type, obj, _ctx)
    case obj
    when ::Spree::Product
      ::Spree::GraphQL::Schema::Types::Product
    when ::Spree::Variant
      ::Spree::GraphQL::Schema::Types::ProductVariant
    when ::Spree::Taxonomy
      ::Spree::GraphQL::Schema::Types::Collection
    when ::Spree::Taxon
      ::Spree::GraphQL::Schema::Types::Collection
    when ::Spree::Address
      ::Spree::GraphQL::Schema::Types::MailingAddress
    else
      raise("Unexpected object: #{obj}")
    end
  end
end
