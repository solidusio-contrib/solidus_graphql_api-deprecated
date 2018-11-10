class Spree::GraphQL::Schema::Types::Order < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'Order'
  description %q{An order is a customer’s completed request to purchase one or more products from a shop. An order is created when a customer completes the checkout process, during which time they provides an email address, billing address and payment information.}
  include ::Spree::GraphQL::Types::Order
  field :currency_code, ::Spree::GraphQL::Schema::Types::CurrencyCode, null: false do
    description %q{The code of the currency used for the payment.}
  end
  field :customer_locale, ::GraphQL::Types::String, null: true do
    description %q{The locale code in which this specific order happened.}
  end
  field :customer_url, ::Spree::GraphQL::Schema::Types::URL, null: true do
    description %q{The unique URL that the customer can use to access the order.}
  end
  field :discount_applications, ::Spree::GraphQL::Schema::Interfaces::DiscountApplication.connection_type, null: false do
    description %q{Discounts that have been applied on the order.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
  end
  field :email, ::GraphQL::Types::String, null: true do
    description %q{The customer's email address.}
  end
  field :line_items, ::Spree::GraphQL::Schema::Types::OrderLineItem.connection_type, null: false do
    description %q{List of the order’s line items.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
  end
  field :name, ::GraphQL::Types::String, null: false do
    description %q{Unique identifier for the order that appears on the order.
For example, _#1000_ or _Store1001.
}
  end
  field :order_number, ::GraphQL::Types::Int, null: false do
    description %q{A unique numeric identifier for the order for use by shop owner and customer.}
  end
  field :phone, ::GraphQL::Types::String, null: true do
    description %q{The customer's phone number.}
  end
  field :processed_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the order was imported.
This value can be set to dates in the past when importing from other systems.
If no value is provided, it will be auto-generated based on current date and time.
}
  end
  field :shipping_address, ::Spree::GraphQL::Schema::Types::MailingAddress, null: true do
    description %q{The address to where the order will be shipped.}
  end
  field :shipping_discount_allocations, [::Spree::GraphQL::Schema::Types::DiscountAllocation], null: false do
    description %q{The discounts that have been allocated onto the shipping line by discount applications.
}
  end
  field :status_url, ::Spree::GraphQL::Schema::Types::URL, null: false do
    description %q{The unique URL for the order's status page.}
  end
  field :subtotal_price, ::Spree::GraphQL::Schema::Types::Money, null: true do
    description %q{Price of the order before shipping and taxes.}
  end
  field :successful_fulfillments, [::Spree::GraphQL::Schema::Types::Fulfillment], null: true do
    description %q{List of the order’s successful fulfillments.}
    argument :first, ::GraphQL::Types::Int, required: false, default_value: nil, description: %q{Truncate the array result to this size.}
  end
  field :total_price, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description %q{The sum of all the prices of all the items in the order, taxes and discounts included (must be positive).}
  end
  field :total_refunded, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description %q{The total amount that has been refunded.}
  end
  field :total_shipping_price, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description %q{The total cost of shipping.}
  end
  field :total_tax, ::Spree::GraphQL::Schema::Types::Money, null: true do
    description %q{The total cost of taxes.}
  end
end
