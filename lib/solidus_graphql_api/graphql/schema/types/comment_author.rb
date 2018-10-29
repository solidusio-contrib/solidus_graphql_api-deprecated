class Spree::GraphQL::Schema::Types::CommentAuthor < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'CommentAuthor'
  description nil
  include ::Spree::GraphQL::Types::CommentAuthor
  field :email, ::GraphQL::Types::String, null: false do
    description %q{The author's email.}
  end
  field :name, ::GraphQL::Types::String, null: false do
    description %q{The author’s name.}
  end
end