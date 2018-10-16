module Spree
  module GraphQL
    module Types
      class OptionValue < BaseObject
        graphql_name 'OptionValue'

        field :id, ID, null: false
        field :name, String, null: false
        field :presentation, String, null: true
        field :position, Integer, null: true
      end
    end
  end
end
