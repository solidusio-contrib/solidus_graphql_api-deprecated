class Spree::GraphQL::Schema::Types::Checkout < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'Checkout'
  description %q{A container for all the information required to checkout items and pay.}
  include ::Spree::GraphQL::Types::Checkout
  field :applied_gift_cards, [::Spree::GraphQL::Schema::Types::AppliedGiftCard], null: false do
    description nil
  end
  field :available_shipping_rates, ::Spree::GraphQL::Schema::Types::AvailableShippingRates, null: true do
    description %q{The available shipping rates for this Checkout.
Should only be used when checkout `requiresShipping` is `true` and
the shipping address is valid.
}
  end
  field :completed_at, ::Spree::GraphQL::Schema::Types::DateTime, null: true do
    description %q{The date and time when the checkout was completed.}
  end
  field :created_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the checkout was created.}
  end
  field :currency_code, ::Spree::GraphQL::Schema::Types::CurrencyCode, null: false do
    description %q{The currency code for the Checkout.}
  end
  field :custom_attributes, [::Spree::GraphQL::Schema::Types::Attribute], null: false do
    description %q{A list of extra information that is added to the checkout.}
  end
  field :discount_applications, ::Spree::GraphQL::Schema::Interfaces::DiscountApplication.connection_type, null: false do
    description %q{Discounts that have been applied on the checkout.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
  end
  field :email, ::GraphQL::Types::String, null: true do
    description %q{The email attached to this checkout.}
  end
  field :id, ::GraphQL::Types::ID, null: false do
    description %q{Globally unique identifier.}
  end
  field :line_items, ::Spree::GraphQL::Schema::Types::CheckoutLineItem.connection_type, null: false do
    description %q{A list of line item objects, each one containing information about an item in the checkout.}
    argument :reverse, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Reverse the order of the underlying list.}
  end
  field :note, ::GraphQL::Types::String, null: true do
    description nil
  end
  field :order, ::Spree::GraphQL::Schema::Types::Order, null: true do
    description %q{The resulting order from a paid checkout.}
  end
  field :order_status_url, ::Spree::GraphQL::Schema::Types::URL, null: true do
    description %q{The Order Status Page for this Checkout, null when checkout is not completed.}
  end
  field :payment_due, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description %q{The amount left to be paid. This is equal to the cost of the line items, taxes and shipping minus discounts and gift cards.}
  end
  field :ready, ::GraphQL::Types::Boolean, null: false do
    description %q{Whether or not the Checkout is ready and can be completed. Checkouts may have asynchronous operations that can take time to finish. If you want to complete a checkout or ensure all the fields are populated and up to date, polling is required until the value is true. }
  end
  field :requires_shipping, ::GraphQL::Types::Boolean, null: false do
    description %q{States whether or not the fulfillment requires shipping.}
  end
  field :shipping_address, ::Spree::GraphQL::Schema::Types::MailingAddress, null: true do
    description %q{The shipping address to where the line items will be shipped.}
  end
  field :shipping_discount_allocations, [::Spree::GraphQL::Schema::Types::DiscountAllocation], null: false do
    description %q{The discounts that have been allocated onto the shipping line by discount applications.
}
  end
  field :shipping_line, ::Spree::GraphQL::Schema::Types::ShippingRate, null: true do
    description %q{Once a shipping rate is selected by the customer it is transitioned to a `shipping_line` object.}
  end
  field :subtotal_price, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description %q{Price of the checkout before shipping and taxes.}
  end
  field :tax_exempt, ::GraphQL::Types::Boolean, null: false do
    description %q{Specifies if the Checkout is tax exempt.}
  end
  field :taxes_included, ::GraphQL::Types::Boolean, null: false do
    description %q{Specifies if taxes are included in the line item and shipping line prices.}
  end
  field :total_price, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description %q{The sum of all the prices of all the items in the checkout, taxes and discounts included.}
  end
  field :total_tax, ::Spree::GraphQL::Schema::Types::Money, null: false do
    description %q{The sum of all the taxes applied to the line items and shipping lines in the checkout.}
  end
  field :updated_at, ::Spree::GraphQL::Schema::Types::DateTime, null: false do
    description %q{The date and time when the checkout was last updated.}
  end
  field :web_url, ::Spree::GraphQL::Schema::Types::URL, null: false do
    description %q{The url pointing to the checkout accessible from the web.}
  end
end
