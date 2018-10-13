module Spree
  module GraphQL
    module Types
      Taxonomy = ::GraphQL::ObjectType.define do
        graphql_name 'Taxonomy'

        field :id, ID, null: true
        field :graphql_name, String, null: true
        field :position, Integer, null: true

        field :root_taxon, Taxon, null: true

        def root_taxon
          object.root
        end

        field :taxons, Taxon.connection_type, null: true, connection: true do
          resolve Resolvers::Taxon::ByTaxonomy
        end
      end
    end
  end
end
