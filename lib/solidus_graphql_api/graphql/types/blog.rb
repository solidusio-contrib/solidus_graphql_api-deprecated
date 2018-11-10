# frozen_string_literal: true
module Spree::GraphQL::Types::Blog
  # articleByHandle: Find an article by its handle.
  # @param handle [Types::String!] The handle of the article.
  # @return [Types::Article]
  def article_by_handle(handle:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # articles: List of the blog's articles.
  # @param reverse [Types::Boolean] (false) Reverse the order of the underlying list.
  # @return [Types::Article.connection_type!]
  def articles(reverse:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # authors: The authors who have contributed to the blog.
  # @return [[Types::ArticleAuthor!]!]
  def authors()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # handle: A human-friendly unique string for the Blog automatically generated from its title.
  # @return [Types::String!]
  def handle()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # id: Globally unique identifier.
  # @return [Types::ID!]
  def id()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # title: The blogs’s title.
  # @return [Types::String!]
  def title()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # url: The url pointing to the blog accessible from the web.
  # @return [Types::URL!]
  def url()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end
