module Solidus
  module GraphQL
    TaxonomyType = ::GraphQL::ObjectType.define do
      graphql_name "Taxonomy"

      field :id, ID, null: true
      field :graphql_name, String, null: true
      field :position, Integer, null: true

      field :root_taxon, TaxonType, null: true

      def root_taxon
        object.root
      end

      field :taxons, TaxonType.connection_type, null: true, connection: true do
        resolve TaxonResolver::ByTaxonomy
      end
    end
  end
end
