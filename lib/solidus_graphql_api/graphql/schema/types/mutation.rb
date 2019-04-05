class Spree::GraphQL::Schema::Types::Mutation < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'Mutation'
  description %q{The schema’s entry-point for mutations. This acts as the public, top-level API from which all mutation queries must start.}
  include ::Spree::GraphQL::Types::Mutation
end
