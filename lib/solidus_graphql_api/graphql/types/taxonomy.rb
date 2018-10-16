module Spree
  module GraphQL
    module Types
      class Taxonomy < BaseObject
        graphql_name 'Taxonomy'

        field :id, ID, null: true
        field :name, String, null: true
        field :position, Integer, null: true

        field :root_taxon, Taxon, null: true

        def root_taxon
          object.root
        end

        field :taxons, [Taxon], null: true, resolve: Resolvers::Taxon::ByTaxonomy
      end
    end
  end
end
