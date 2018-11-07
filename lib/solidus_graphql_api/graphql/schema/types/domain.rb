class Spree::GraphQL::Schema::Types::Domain < Spree::GraphQL::Schema::Types::BaseObjectNoId
  graphql_name 'Domain'
  description %q{Represents a web address.}
  include ::Spree::GraphQL::Types::Domain
  field :host, ::GraphQL::Types::String, null: false do
    description %q{The host name of the domain (eg: `example.com`).}
  end
  field :ssl_enabled, ::GraphQL::Types::Boolean, null: false do
    description %q{Whether SSL is enabled or not.}
  end
  field :url, ::Spree::GraphQL::Schema::Types::URL, null: false do
    description %q{The URL of the domain (eg: `https://example.com`).}
  end
end