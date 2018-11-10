class Spree::GraphQL::Schema::Types::Customer < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'Customer'
  description %q{A customer represents a customer account with the shop. Customer accounts store contact information for the customer, saving logged-in customers the trouble of having to provide it at every checkout.}
  include ::Spree::GraphQL::Types::Customer
  field :accepts_marketing, ::GraphQL::Types::Boolean, null: false do
    description %q{Indicates whether the customer has consented to be sent marketing material via email.}
  end
  field :addresses, ::Spree::GraphQL::Schema::Types::MailingAddress.connection_type, null: false do
    description %q{A list of addresses for the customer.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
  end
  field :created_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the customer was created.}
  end
  field :default_address, ::Spree::GraphQL::Schema::Types::MailingAddress, null: true do
    description %q{The customer’s default address.}
  end
  field :display_name, ::GraphQL::Types::String, null: false do
    description %q{The customer’s name, email or phone number.}
  end
  field :email, ::GraphQL::Types::String, null: true do
    description %q{The customer’s email address.}
  end
  field :first_name, ::GraphQL::Types::String, null: true do
    description %q{The customer’s first name.}
  end
  field :id, ::GraphQL::Types::ID, null: false do
    description %q{A unique identifier for the customer.}
  end
  field :last_incomplete_checkout, ::Spree::GraphQL::Schema::Types::Checkout, null: true do
    description %q{The customer's most recently updated, incomplete checkout.}
  end
  field :last_name, ::GraphQL::Types::String, null: true do
    description %q{The customer’s last name.}
  end
  field :orders, ::Spree::GraphQL::Schema::Types::Order.connection_type, null: false do
    description %q{The orders associated with the customer.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
    argument :sort_key, ::Spree::GraphQL::Schema::Types::OrderSortKeys, required: false, default_value: 'ID', description: %q{Sort the underlying list by the given key.}
    argument :query, ::GraphQL::Types::String, required: false, default_value: nil, description: %q{Supported filter parameters:
 - `processed_at`

See the detailed [search syntax](https://help.solidus.io/api/getting-started/search-syntax).
}
  end
  field :phone, ::GraphQL::Types::String, null: true do
    description %q{The customer’s phone number.}
  end
  field :updated_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the customer information was updated.}
  end
end
