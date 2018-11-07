# frozen_string_literal: true
module Spree::GraphQL::Types::ShopPolicy
  include ::Spree::GraphQL::Interfaces::Node

  # body: Policy text, maximum size of 64kb.
  # @return [Types::String!]
  def body()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # id: Globally unique identifier.
  # @return [Types::ID!]
  def id()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # title: Policy’s title.
  # @return [Types::String!]
  def title()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # url: Public URL to the policy.
  # @return [Types::URL!]
  def url()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end