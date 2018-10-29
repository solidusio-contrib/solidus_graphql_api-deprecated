class Spree::GraphQL::Schema::Types::ArticleAuthor < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'ArticleAuthor'
  description nil
  include ::Spree::GraphQL::Types::ArticleAuthor
  field :bio, ::GraphQL::Types::String, null: true do
    description %q{The author's bio.}
  end
  field :email, ::GraphQL::Types::String, null: false do
    description %q{The author’s email.}
  end
  field :first_name, ::GraphQL::Types::String, null: false do
    description %q{The author's first name.}
  end
  field :last_name, ::GraphQL::Types::String, null: false do
    description %q{The author's last name.}
  end
  field :name, ::GraphQL::Types::String, null: false do
    description %q{The author's full name.}
  end
end