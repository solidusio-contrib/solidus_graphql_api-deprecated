# frozen_string_literal: true
module Spree::GraphQL::Types::ProductVariantSortKeys

  def self.apply!(r, **args)
    if args[:sort_key]
      r.reorder! \
      case args[:sort_key]
        when 'TITLE'
          :name
        when 'SKU'
          raise ::Spree::GraphQL::NotImplementedError.new
        when 'POSITION'
          :position
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
