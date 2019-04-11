# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::ProductSortKeys < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'ProductSortKeys'

  description %q{The set of valid sort keys for the products query.}

  value 'TITLE', %q{Sort by the `title` value.}
  value 'PRODUCT_TYPE', %q{Sort by the `product_type` value.}
  value 'VENDOR', %q{Sort by the `vendor` value.}
  value 'UPDATED_AT', %q{Sort by the `updated_at` value.}
  value 'CREATED_AT', %q{Sort by the `created_at` value.}
  value 'BEST_SELLING', %q{Sort by the `best_selling` value.}
  value 'PRICE', %q{Sort by the `price` value.}
  value 'ID', %q{Sort by the `id` value.}
  value 'RELEVANCE', %q{During a search (i.e. when the `query` parameter has been specified on the connection) this sorts the
results by relevance to the search term(s). When no search query is specified, this sort key is not
deterministic and should not be used.
}

  def self.apply!(r, **args)
    if args[:sort_key]
      r.reorder!(
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
      )
    end
    r.reverse_order! if args[:reverse]
    r
  end
end
