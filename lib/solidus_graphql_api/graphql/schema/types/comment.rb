class Spree::GraphQL::Schema::Types::Comment < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'Comment'
  description nil
  implements ::Spree::GraphQL::Schema::Interfaces::Node
  include ::Spree::GraphQL::Types::Comment
  field :author, ::Spree::GraphQL::Schema::Types::CommentAuthor, null: false do
    description %q{The comment’s author.}
  end
  field :content, ::GraphQL::Types::String, null: false do
    description %q{Stripped content of the comment, single line with HTML tags removed.}
    argument :truncate_at, ::GraphQL::Types::Int, required: false, description: %q{Truncates string after the given length.}
  end
  field :content_html, ::Spree::GraphQL::Schema::Types::HTML, null: false do
    description %q{The content of the comment, complete with HTML formatting.}
  end
  field :id, ::GraphQL::Types::ID, null: false do
    description %q{Globally unique identifier.}
  end
end