module Spree
  module GraphQL
    class Schema < ::GraphQL::Schema
      mutation(::Spree::GraphQL::MutationType)
      query(::Spree::GraphQL::QueryType)
    end
  end
end
