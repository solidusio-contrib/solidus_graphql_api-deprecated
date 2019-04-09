# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::Domain < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'Domain'

  description %q{Represents a web address.}

  field :host, ::GraphQL::Types::String, null: false do
    description %q{The host name of the domain (eg: `example.com`).}
  end
  def host
    object.host
  end

  field :ssl_enabled, ::GraphQL::Types::Boolean, null: false do
    description %q{Whether SSL is enabled or not.}
  end
  def ssl_enabled
    object.ssl_enabled
  end

  field :url, ::Spree::GraphQL::Schema::Types::URL, null: false do
    description %q{The URL of the domain (eg: `https://example.com`).}
  end
  def url
    object.url
  end
end
