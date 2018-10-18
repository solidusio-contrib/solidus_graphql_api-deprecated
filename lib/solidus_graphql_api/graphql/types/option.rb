module Spree
  module GraphQL
    module Types
      class Option < BaseObject
        graphql_name 'Option'

        field :id, ID, null: false
        field :name, String, null: false
        field :presentation, String, null: true
        field :position, Integer, null: true
      end
    end
  end
end
