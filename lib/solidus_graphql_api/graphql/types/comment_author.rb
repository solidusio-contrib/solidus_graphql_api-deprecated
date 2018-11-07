# frozen_string_literal: true
module Spree::GraphQL::Types::CommentAuthor

  # email: The author's email.
  # @return [Types::String!]
  def email()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # name: The author’s name.
  # @return [Types::String!]
  def name()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end