# frozen_string_literal: true
module Spree::GraphQL::Types::CustomerAccessToken

  # accessToken: The customer’s access token.
  # @return [Types::String!]
  def access_token()
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # expiresAt: The date and time when the customer access token expires.
  # @return [Types::DateTime!]
  def expires_at()
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end