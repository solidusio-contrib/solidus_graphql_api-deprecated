module Solidus
  module GraphQL
    class OptionType < ::Types::BaseObject
      graphql_name "OptionType"

      field :id, ID, null: false
      field :graphql_name, String, null: false
      field :presentation, String, null: true
      field :position, Integer, null: true
    end
  end
end