module Solidus
  module GraphQL
    class Attachment < ::GraphQL::Schema::Object
    graphql_name "Attachment"

      field :id, ID, null: false
      field :url, String, null: false
      field :default_url, String, null: false
      field :default_style,String, null: false
      field :path, String, null: false

    end
  end
end

