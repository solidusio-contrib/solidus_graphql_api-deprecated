class Spree::GraphQL::Schema::Schema < GraphQL::Schema
  query ::Spree::GraphQL::Schema::Types::QueryRoot
  mutation ::Spree::GraphQL::Schema::Types::Mutation

  def self.id_from_object(object, type_definition = nil, query_context = nil)
    ::GraphQL::Schema::UniqueWithinType.encode(object.class.name, object.id)
  end

  def self.object_from_id(id, query_context = nil)
    class_name, item_id = ::GraphQL::Schema::UniqueWithinType.decode(id)
    ::Object.const_get(class_name).find(item_id)
  end

  def self.resolve_type(type, obj, ctx)
    case obj
    when ::Spree::Product
      ::Spree::GraphQL::Schema::Types::Product
    when ::Spree::Variant
      ::Spree::GraphQL::Schema::Types::ProductVariant
    when ::Spree::Taxonomy
      ::Spree::GraphQL::Schema::Types::Collection
    when ::Spree::Taxon
      ::Spree::GraphQL::Schema::Types::Collection

      #::Spree::GraphQL::Schema::Types::AppliedGiftCard
      #::Spree::GraphQL::Schema::Types::Article
      #::Spree::GraphQL::Schema::Types::Blog
      #::Spree::GraphQL::Schema::Types::Checkout
      #::Spree::GraphQL::Schema::Types::CheckoutLineItem
      #::Spree::GraphQL::Schema::Types::Comment
      #::Spree::GraphQL::Schema::Types::MailingAddress
      #::Spree::GraphQL::Schema::Types::Order
      #::Spree::GraphQL::Schema::Types::Payment
      #::Spree::GraphQL::Schema::Types::Product
      #::Spree::GraphQL::Schema::Types::ProductOption
      #::Spree::GraphQL::Schema::Types::ProductVariant
      #::Spree::GraphQL::Schema::Types::ShopPolicy
    else
      raise("Unexpected object: #{obj}")
    end
  end
end
