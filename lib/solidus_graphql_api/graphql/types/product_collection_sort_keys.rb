# frozen_string_literal: true
module Spree::GraphQL::Types::ProductCollectionSortKeys

  def self.apply!(r, **args)
    if args[:sort_key]
      r.reorder! \
      case args[:sort_key]
      when 'TITLE'
        :name
      when 'PRICE'
        raise ::Spree::GraphQL::NotImplementedError.new
      when 'BEST_SELLING'
        raise ::Spree::GraphQL::NotImplementedError.new
      when 'CREATED'
        :created_at
      when 'ID'
        :id
      when 'MANUAL'
        raise ::Spree::GraphQL::NotImplementedError.new
      when 'COLLECTION_DEFAULT'
        # TODO Should be set to collection's chosen value
        # if/when this field gets added to the model.
      when 'RELEVANCE'
        raise ::Spree::GraphQL::NotImplementedError.new
      else
        raise ::Spree::GraphQL::NotImplementedError.new
      end
    end
    if args[:reverse]
      r.reverse_order!
    end
    r
  end
end
