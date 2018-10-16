module Spree
  module GraphQL
    module Types
      require_relative './attachment'
      class Image < BaseObject
        graphql_name 'Image'
        field :attachment, Attachment, null: true
      end
    end
  end
end
