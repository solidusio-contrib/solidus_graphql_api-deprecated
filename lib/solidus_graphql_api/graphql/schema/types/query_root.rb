class Spree::GraphQL::Schema::Types::QueryRoot < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'QueryRoot'
  description %q{The schema’s entry-point for queries. This acts as the public, top-level API from which all queries must start.}
  include ::Spree::GraphQL::Types::QueryRoot

  field :node, field: ::GraphQL::Relay::Node.field
  field :nodes, field: ::GraphQL::Relay::Node.plural_field

  field :articles, ::Spree::GraphQL::Schema::Types::Article.connection_type, null: false do
    description %q{List of the shop's articles.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
    argument :sort_key, ::Spree::GraphQL::Schema::Types::ArticleSortKeys, required: false, default_value: 'ID', description: %q{Sort the underlying list by the given key.}
    argument :query, ::GraphQL::Types::String, required: false, default_value: nil, description: %q{Supported filter parameters:
 - `author`
 - `updated_at`
 - `created_at`
 - `blog_title`
 - `tag`

See the detailed [search syntax](https://help.solidus.io/api/getting-started/search-syntax).
}
  end
  field :blog_by_handle, ::Spree::GraphQL::Schema::Types::Blog, null: true do
    description %q{Find a blog by its handle.}
    argument :handle, ::GraphQL::Types::String, required: true, description: %q{The handle of the blog.}
  end
  field :blogs, ::Spree::GraphQL::Schema::Types::Blog.connection_type, null: false do
    description %q{List of the shop's blogs.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
    argument :sort_key, ::Spree::GraphQL::Schema::Types::BlogSortKeys, required: false, default_value: 'ID', description: %q{Sort the underlying list by the given key.}
    argument :query, ::GraphQL::Types::String, required: false, default_value: nil, description: %q{Supported filter parameters:
 - `handle`
 - `title`
 - `updated_at`
 - `created_at`

See the detailed [search syntax](https://help.solidus.io/api/getting-started/search-syntax).
}
  end
  field :customer, ::Spree::GraphQL::Schema::Types::Customer, null: true do
    description nil
    argument :customer_access_token, ::GraphQL::Types::String, required: true, description: %q{The customer access token}
  end

  field :shop, ::Spree::GraphQL::Schema::Types::Shop, null: false do
    description nil
  end
end
