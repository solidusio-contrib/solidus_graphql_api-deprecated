# frozen_string_literal: true
module Spree::GraphQL::Types::CollectionSortKeys

  def self.apply!(r, **args)
    if args[:sort_key]
      r.reorder! \
      case args[:sort_key]
        when 'TITLE'
          :name
        when 'UPDATED_AT'
          :updated_at
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
