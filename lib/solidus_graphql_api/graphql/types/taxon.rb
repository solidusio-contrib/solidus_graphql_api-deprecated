module Spree
  module GraphQL
    module Types
      class Taxon < BaseObject
        graphql_name 'Taxon'

        field :id, ID, null: true
        field :name, String, null: true
        field :position, Integer, null: true
        field :description, String, null: true
        field :icon_file_name, String, null: true

        field :permalink, String, null: true
        field :pretty_graphql_name, String, null: true
        field :seo_title, String, null: true

        field :products, [Product], null: true, resolve: Resolvers::Product::ByTaxon
      end
    end
  end
end
