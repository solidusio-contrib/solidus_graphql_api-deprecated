module Spree
  module GraphQL
    TaxonType = ::GraphQL::ObjectType.define do
      graphql_name "Taxon"

      field :id, ID, null: true
      field :graphql_name, String, null: true
      field :permalink, String, null: true
      field :pretty_graphql_name, String, null: true
      field :seo_title, String, null: true

      field :products, ProductType.connection_type, null: true, connection: true do
        resolve ProductResolver::ByTaxon
      end
    end
  end
end
