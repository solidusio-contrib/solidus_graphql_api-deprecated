module Solidus
  module GraphQL
    class TaxonomyType < ::Types::BaseObject
      graphql_name "Taxonomy"

      field :id, ID, null: true
      field :name, String, null: true
      field :position, Integer, null: true

      field :root_taxon, TaxonType, null: true

      def root_taxon
        object.root
      end

      field :taxons, [TaxonType], null: true, resolve: TaxonResolver::ByTaxonomy
    end
  end
end
