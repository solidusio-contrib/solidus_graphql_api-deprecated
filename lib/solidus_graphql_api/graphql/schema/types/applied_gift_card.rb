class Spree::GraphQL::Schema::Types::AppliedGiftCard < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'AppliedGiftCard'
  description %q{Details about the gift card used on the checkout.}
  implements ::Spree::GraphQL::Schema::Interfaces::Node
  include ::Spree::GraphQL::Types::AppliedGiftCard
  field :amount_used, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description %q{The amount that was used taken from the Gift Card by applying it.}
  end
  field :balance, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description %q{The amount left on the Gift Card.}
  end
  field :id, ::GraphQL::Types::ID, null: false do
    description %q{Globally unique identifier.}
  end
  field :last_characters, ::GraphQL::Types::String, null: false do
    description %q{The last characters of the Gift Card code}
  end
end