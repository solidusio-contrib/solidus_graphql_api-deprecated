module Solidus
  module GraphQL
    class Style < ::GraphQL::Schema::Object
      field :style_graphql_name, String, null: true
      field :geometry, String, null: true
      field :url, String, null: false
    end
  end
end

