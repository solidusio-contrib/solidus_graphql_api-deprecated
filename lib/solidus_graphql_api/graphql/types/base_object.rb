module Spree
  module GraphQL
    module Types
      class BaseObject < ::GraphQL::Schema::Object
        global_id_field :id
      end
    end
  end
end
