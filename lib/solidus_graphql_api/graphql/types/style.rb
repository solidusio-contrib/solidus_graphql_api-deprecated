module Spree
  module GraphQL
    module Types
      class Style < ::GraphQL::Schema::Object
        field :style_graphql_name, String, null: true
        field :geometry, String, null: true
        field :url, String, null: false
      end
    end
  end
end

