class Spree::GraphQL::Schema::Schema < GraphQL::Schema
  query ::Spree::GraphQL::Schema::Types::QueryRoot
  #mutation ::Spree::GraphQL::Schema::Types::Mutation
end
