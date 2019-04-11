# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::ProductCollectionSortKeys < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'ProductCollectionSortKeys'

  description %q{The set of valid sort keys for the products query.}

  value 'TITLE', %q{Sort by the `title` value.}
  value 'PRICE', %q{Sort by the `price` value.}
  value 'BEST_SELLING', %q{Sort by the `best-selling` value.}
  value 'CREATED', %q{Sort by the `created` value.}
  value 'ID', %q{Sort by the `id` value.}
  value 'MANUAL', %q{Sort by the `manual` value.}
  value 'COLLECTION_DEFAULT', %q{Sort by the `collection-default` value.}
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
      )
    end
    r.reverse_order! if args[:reverse]
    r
  end
end
