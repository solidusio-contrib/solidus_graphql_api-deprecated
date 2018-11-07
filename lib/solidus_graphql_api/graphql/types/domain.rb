# frozen_string_literal: true
module Spree::GraphQL::Types::Domain

  # host: The host name of the domain (eg: `example.com`).
  # @return [Types::String!]
  def host()
    object.host
  end

  # sslEnabled: Whether SSL is enabled or not.
  # @return [Types::Boolean!]
  def ssl_enabled()
    object.ssl_enabled
  end

  # url: The URL of the domain (eg: `https://example.com`).
  # @return [Types::URL!]
  def url()
    object.url
  end
end
