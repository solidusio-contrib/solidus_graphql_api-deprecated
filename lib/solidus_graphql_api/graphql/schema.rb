module Spree
  module GraphQL
    class Schema < ::GraphQL::Schema
      mutation(::Spree::GraphQL::Types::Mutation)
      query(::Spree::GraphQL::Types::Query)
    end
  end
end
