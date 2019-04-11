# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::ProductVariantSortKeys < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'ProductVariantSortKeys'

  description %q{The set of valid sort keys for the variants query.}

  value 'TITLE', %q{Sort by the `title` value.}
  value 'SKU', %q{Sort by the `sku` value.}
  value 'POSITION', %q{Sort by the `position` value.}
  value 'ID', %q{Sort by the `id` value.}
  value 'RELEVANCE', %q{During a search (i.e. when the `query` parameter has been specified on the connection) this sorts the
results by relevance to the search term(s). When no search query is specified, this sort key is not
deterministic and should not be used.
}

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
