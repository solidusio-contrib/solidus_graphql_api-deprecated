# frozen_string_literal: true

require 'graphql'
require 'ostruct'

class Spree::GraphQL::Schema < ::GraphQL::Schema
  module Inputs; end
  module Interfaces; end
  module Payloads; end
  module Types; end

  require_relative './not_implemented_error'

  require_relative './schema/types/base_object'
  require_relative './schema/types/base_object_node'
  require_relative './schema/types/base_enum'
  require_relative './schema/types/base_scalar'
  require_relative './schema/inputs/base_input'
  require_relative './schema/interfaces/base_interface'
  require_relative './schema/payloads/base_payload'
  require_relative './schema/types/base_union'
  require_relative './schema/types/date_time'

  require_relative './schema/types/country_code'
  require_relative './schema/types/mailing_address'

  require_relative './schema/types/decimal'
  require_relative './schema/types/currency_code'
  require_relative './schema/types/url'
  require_relative './schema/types/html'
  require_relative './schema/types/product_collection_sort_keys'
  require_relative './schema/types/collection'
  require_relative './schema/types/product_variant_sort_keys'
  require_relative './schema/types/product_sort_keys'
  require_relative './schema/types/product_variant'
  require_relative './schema/types/product'

  require_relative './schema/types/credit_card'
  require_relative './schema/types/collection_sort_keys'
  require_relative './schema/types/domain'
  require_relative './schema/types/payment_settings'
  require_relative './schema/types/shop'

  require_relative './schema/types/query_root'
  require_relative './schema/types/mutation'

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
