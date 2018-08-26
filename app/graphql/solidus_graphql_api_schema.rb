class SolidusGraphQLApiSchema < GraphQL::Schema
  mutation(::Solidus::GraphQL::MutationType)
  query(::Solidus::GraphQL::QueryType)
end
