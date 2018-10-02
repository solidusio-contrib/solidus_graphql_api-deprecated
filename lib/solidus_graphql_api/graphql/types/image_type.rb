module Solidus
  module GraphQL
    require_relative './attachment_type'
    class ImageType < ::Types::BaseObject
      graphql_name "Image"
      field :attachment, Attachment, null: true
    end
  end
end