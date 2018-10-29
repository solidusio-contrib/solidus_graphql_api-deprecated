# frozen_string_literal: true
module Spree::GraphQL::Types::ArticleAuthor

  # bio: The author's bio.
  # @return [Types::String]
  def bio()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # email: The author’s email.
  # @return [Types::String!]
  def email()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # firstName: The author's first name.
  # @return [Types::String!]
  def first_name()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # lastName: The author's last name.
  # @return [Types::String!]
  def last_name()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # name: The author's full name.
  # @return [Types::String!]
  def name()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end