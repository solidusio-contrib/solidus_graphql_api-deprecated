# frozen_string_literal: true
module Spree::GraphQL::Types::ProductSortKeys

  def self.apply!(r, **args)
    if args[:sort_key]
      r.reorder! \
      case args[:sort_key]
      when 'TITLE'
        :name
      when 'PRODUCT_TYPE'
        raise ::Spree::GraphQL::NotImplementedError.new
      when 'VENDOR'
        raise ::Spree::GraphQL::NotImplementedError.new
      when 'UPDATED_AT'
        :updated_at
      when 'CREATED_AT'
        :created_at
      when 'BEST_SELLING'
        raise ::Spree::GraphQL::NotImplementedError.new
      when 'PRICE'
        raise ::Spree::GraphQL::NotImplementedError.new
      when 'ID'
        :id
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
