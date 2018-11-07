class Spree::GraphQL::Schema::Types::Mutation < Spree::GraphQL::Schema::Types::BaseObject
  graphql_name 'Mutation'
  description %q{The schema’s entry-point for mutations. This acts as the public, top-level API from which all mutation queries must start.}
  include ::Spree::GraphQL::Types::Mutation
  field :checkout_attributes_update_v2, ::Spree::GraphQL::Schema::Payloads::CheckoutAttributesUpdateV2, null: true do
    description %q{Updates the attributes of a checkout.}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
    argument :input, ::Spree::GraphQL::Schema::Inputs::CheckoutAttributesUpdateV2, required: true, description: %q{The checkout attributes to update.}
  end
  field :checkout_complete_free, ::Spree::GraphQL::Schema::Payloads::CheckoutCompleteFree, null: true do
    description nil
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
  end
  field :checkout_complete_with_credit_card_v2, ::Spree::GraphQL::Schema::Payloads::CheckoutCompleteWithCreditCardV2, null: true do
    description %q{Completes a checkout using a credit card token from Solidus's Vault.}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
    argument :payment, ::Spree::GraphQL::Schema::Inputs::CreditCardPaymentV2, required: true, description: %q{The credit card info to apply as a payment.}
  end
  field :checkout_complete_with_tokenized_payment_v2, ::Spree::GraphQL::Schema::Payloads::CheckoutCompleteWithTokenizedPaymentV2, null: true do
    description %q{Completes a checkout with a tokenized payment.}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
    argument :payment, ::Spree::GraphQL::Schema::Inputs::TokenizedPaymentV2, required: true, description: %q{The info to apply as a tokenized payment.}
  end
  field :checkout_create, ::Spree::GraphQL::Schema::Payloads::CheckoutCreate, null: true do
    description %q{Creates a new checkout.}
    argument :input, ::Spree::GraphQL::Schema::Inputs::CheckoutCreate, required: true, description: nil
  end
  field :checkout_customer_associate_v2, ::Spree::GraphQL::Schema::Payloads::CheckoutCustomerAssociateV2, null: true do
    description %q{Associates a customer to the checkout.}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
    argument :customer_access_token, ::GraphQL::Types::String, required: true, description: %q{The customer access token of the customer to associate.}
  end
  field :checkout_customer_disassociate, ::Spree::GraphQL::Schema::Payloads::CheckoutCustomerDisassociate, null: true do
    description %q{Disassociates the current checkout customer from the checkout.}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
  end
  field :checkout_discount_code_apply, ::Spree::GraphQL::Schema::Payloads::CheckoutDiscountCodeApply, null: true do
    description %q{Applies a discount to an existing checkout using a discount code.}
    argument :discount_code, ::GraphQL::Types::String, required: true, description: %q{The discount code to apply to the checkout.}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
  end
  field :checkout_discount_code_remove, ::Spree::GraphQL::Schema::Payloads::CheckoutDiscountCodeRemove, null: true do
    description %q{Removes the applied discount from an existing checkout.}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
  end
  field :checkout_email_update, ::Spree::GraphQL::Schema::Payloads::CheckoutEmailUpdate, null: true do
    description %q{Updates the email on an existing checkout.}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
    argument :email, ::GraphQL::Types::String, required: true, description: %q{The email to update the checkout with.}
  end
  field :checkout_gift_card_remove, ::Spree::GraphQL::Schema::Payloads::CheckoutGiftCardRemove, null: true do
    description %q{Removes an applied gift card from the checkout.}
    argument :applied_gift_card_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the Applied Gift Card to remove from the Checkout}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
  end
  field :checkout_gift_cards_append, ::Spree::GraphQL::Schema::Payloads::CheckoutGiftCardsAppend, null: true do
    description %q{Appends gift cards to an existing checkout.}
    argument :gift_card_codes, [::GraphQL::Types::String], required: true, description: %q{A list of gift card codes to append to the checkout.}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
  end
  field :checkout_line_items_add, ::Spree::GraphQL::Schema::Payloads::CheckoutLineItemsAdd, null: true do
    description %q{Adds a list of line items to a checkout.}
    argument :line_items, [::Spree::GraphQL::Schema::Inputs::CheckoutLineItem], required: true, description: %q{A list of line item objects to add to the checkout.}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
  end
  field :checkout_line_items_remove, ::Spree::GraphQL::Schema::Payloads::CheckoutLineItemsRemove, null: true do
    description %q{Removes line items from an existing checkout}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{the checkout on which to remove line items}
    argument :line_item_ids, [::GraphQL::Types::ID], required: true, description: %q{line item ids to remove}
  end
  field :checkout_line_items_update, ::Spree::GraphQL::Schema::Payloads::CheckoutLineItemsUpdate, null: true do
    description %q{Updates line items on a checkout.}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{the checkout on which to update line items.}
    argument :line_items, [::Spree::GraphQL::Schema::Inputs::CheckoutLineItemUpdate], required: true, description: %q{line items to update.}
  end
  field :checkout_shipping_address_update, ::Spree::GraphQL::Schema::Payloads::CheckoutShippingAddressUpdate, null: true do
    description %q{Updates the shipping address of an existing checkout.}
    argument :shipping_address, ::Spree::GraphQL::Schema::Inputs::MailingAddress, required: true, description: %q{The shipping address to where the line items will be shipped.}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
  end
  field :checkout_shipping_line_update, ::Spree::GraphQL::Schema::Payloads::CheckoutShippingLineUpdate, null: true do
    description %q{Updates the shipping lines on an existing checkout.}
    argument :checkout_id, ::GraphQL::Types::ID, required: true, description: %q{The ID of the checkout.}
    argument :shipping_rate_handle, ::GraphQL::Types::String, required: true, description: %q{A concatenation of a Checkout’s shipping provider, price, and title, enabling the customer to select the availableShippingRates.}
  end
  field :customer_access_token_create, ::Spree::GraphQL::Schema::Payloads::CustomerAccessTokenCreate, null: true do
    description %q{Creates a customer access token.
The customer access token is required to modify the customer object in any way.
}
    argument :input, ::Spree::GraphQL::Schema::Inputs::CustomerAccessTokenCreate, required: true, description: nil
  end
  field :customer_access_token_delete, ::Spree::GraphQL::Schema::Payloads::CustomerAccessTokenDelete, null: true do
    description %q{Permanently destroys a customer access token.}
    argument :customer_access_token, ::GraphQL::Types::String, required: true, description: %q{The access token used to identify the customer.}
  end
  field :customer_access_token_renew, ::Spree::GraphQL::Schema::Payloads::CustomerAccessTokenRenew, null: true do
    description %q{Renews a customer access token.

Access token renewal must happen *before* a token expires.
If a token has already expired, a new one should be created instead via `customerAccessTokenCreate`.
}
    argument :customer_access_token, ::GraphQL::Types::String, required: true, description: %q{The access token used to identify the customer.}
  end
  field :customer_activate, ::Spree::GraphQL::Schema::Payloads::CustomerActivate, null: true do
    description %q{Activates a customer.}
    argument :id, ::GraphQL::Types::ID, required: true, description: %q{Specifies the customer to activate.}
    argument :input, ::Spree::GraphQL::Schema::Inputs::CustomerActivate, required: true, description: nil
  end
  field :customer_address_create, ::Spree::GraphQL::Schema::Payloads::CustomerAddressCreate, null: true do
    description %q{Creates a new address for a customer.}
    argument :customer_access_token, ::GraphQL::Types::String, required: true, description: %q{The access token used to identify the customer.}
    argument :address, ::Spree::GraphQL::Schema::Inputs::MailingAddress, required: true, description: %q{The customer mailing address to create.}
  end
  field :customer_address_delete, ::Spree::GraphQL::Schema::Payloads::CustomerAddressDelete, null: true do
    description %q{Permanently deletes the address of an existing customer.}
    argument :id, ::GraphQL::Types::ID, required: true, description: %q{Specifies the address to delete.}
    argument :customer_access_token, ::GraphQL::Types::String, required: true, description: %q{The access token used to identify the customer.}
  end
  field :customer_address_update, ::Spree::GraphQL::Schema::Payloads::CustomerAddressUpdate, null: true do
    description %q{Updates the address of an existing customer.}
    argument :customer_access_token, ::GraphQL::Types::String, required: true, description: %q{The access token used to identify the customer.}
    argument :id, ::GraphQL::Types::ID, required: true, description: %q{Specifies the customer address to update.}
    argument :address, ::Spree::GraphQL::Schema::Inputs::MailingAddress, required: true, description: %q{The customer’s mailing address.}
  end
  field :customer_create, ::Spree::GraphQL::Schema::Payloads::CustomerCreate, null: true do
    description %q{Creates a new customer.}
    argument :input, ::Spree::GraphQL::Schema::Inputs::CustomerCreate, required: true, description: nil
  end
  field :customer_default_address_update, ::Spree::GraphQL::Schema::Payloads::CustomerDefaultAddressUpdate, null: true do
    description %q{Updates the default address of an existing customer.}
    argument :customer_access_token, ::GraphQL::Types::String, required: true, description: %q{The access token used to identify the customer.}
    argument :address_id, ::GraphQL::Types::ID, required: true, description: %q{ID of the address to set as the new default for the customer.}
  end
  field :customer_recover, ::Spree::GraphQL::Schema::Payloads::CustomerRecover, null: true do
    description %q{Sends a reset password email to the customer, as the first step in the reset password process.}
    argument :email, ::GraphQL::Types::String, required: true, description: %q{The email address of the customer to recover.}
  end
  field :customer_reset, ::Spree::GraphQL::Schema::Payloads::CustomerReset, null: true do
    description %q{Resets a customer’s password with a token received from `CustomerRecover`.}
    argument :id, ::GraphQL::Types::ID, required: true, description: %q{Specifies the customer to reset.}
    argument :input, ::Spree::GraphQL::Schema::Inputs::CustomerReset, required: true, description: nil
  end
  field :customer_reset_by_url, ::Spree::GraphQL::Schema::Payloads::CustomerResetByUrl, null: true do
    description %q{Resets a customer’s password with the reset password url received from `CustomerRecover`.}
    argument :reset_url, ::Spree::GraphQL::Schema::Types::URL, required: true, description: %q{The customer's reset password url.}
    argument :password, ::GraphQL::Types::String, required: true, description: %q{New password that will be set as part of the reset password process.}
  end
  field :customer_update, ::Spree::GraphQL::Schema::Payloads::CustomerUpdate, null: true do
    description %q{Updates an existing customer.}
    argument :customer_access_token, ::GraphQL::Types::String, required: true, description: %q{The access token used to identify the customer.}
    argument :customer, ::Spree::GraphQL::Schema::Inputs::CustomerUpdate, required: true, description: %q{The customer object input.}
  end
end