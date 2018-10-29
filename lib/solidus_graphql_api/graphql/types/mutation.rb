# frozen_string_literal: true
module Spree::GraphQL::Types::Mutation

  # checkoutAttributesUpdateV2: Updates the attributes of a checkout.
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @param input [Inputs::CheckoutAttributesUpdateV2!] The checkout attributes to update.
  # @return [Payloads::CheckoutAttributesUpdateV2]
  def checkout_attributes_update_v2(checkout_id:, input:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutCompleteFree
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @return [Payloads::CheckoutCompleteFree]
  def checkout_complete_free(checkout_id:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutCompleteWithCreditCardV2: Completes a checkout using a credit card token from Solidus's Vault.
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @param payment [Inputs::CreditCardPaymentV2!] The credit card info to apply as a payment.
  # @return [Payloads::CheckoutCompleteWithCreditCardV2]
  def checkout_complete_with_credit_card_v2(checkout_id:, payment:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutCompleteWithTokenizedPaymentV2: Completes a checkout with a tokenized payment.
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @param payment [Inputs::TokenizedPaymentV2!] The info to apply as a tokenized payment.
  # @return [Payloads::CheckoutCompleteWithTokenizedPaymentV2]
  def checkout_complete_with_tokenized_payment_v2(checkout_id:, payment:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutCreate: Creates a new checkout.
  # @param input [Inputs::CheckoutCreate!]
  # @return [Payloads::CheckoutCreate]
  def checkout_create(input:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutCustomerAssociateV2: Associates a customer to the checkout.
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @param customer_access_token [Types::String!] The customer access token of the customer to associate.
  # @return [Payloads::CheckoutCustomerAssociateV2]
  def checkout_customer_associate_v2(checkout_id:, customer_access_token:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutCustomerDisassociate: Disassociates the current checkout customer from the checkout.
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @return [Payloads::CheckoutCustomerDisassociate]
  def checkout_customer_disassociate(checkout_id:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutDiscountCodeApply: Applies a discount to an existing checkout using a discount code.
  # @param discount_code [Types::String!] The discount code to apply to the checkout.
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @return [Payloads::CheckoutDiscountCodeApply]
  def checkout_discount_code_apply(discount_code:, checkout_id:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutDiscountCodeRemove: Removes the applied discount from an existing checkout.
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @return [Payloads::CheckoutDiscountCodeRemove]
  def checkout_discount_code_remove(checkout_id:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutEmailUpdate: Updates the email on an existing checkout.
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @param email [Types::String!] The email to update the checkout with.
  # @return [Payloads::CheckoutEmailUpdate]
  def checkout_email_update(checkout_id:, email:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutGiftCardRemove: Removes an applied gift card from the checkout.
  # @param applied_gift_card_id [Types::ID!] The ID of the Applied Gift Card to remove from the Checkout
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @return [Payloads::CheckoutGiftCardRemove]
  def checkout_gift_card_remove(applied_gift_card_id:, checkout_id:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutGiftCardsAppend: Appends gift cards to an existing checkout.
  # @param gift_card_codes [[Types::String!]!] A list of gift card codes to append to the checkout.
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @return [Payloads::CheckoutGiftCardsAppend]
  def checkout_gift_cards_append(gift_card_codes:, checkout_id:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutLineItemsAdd: Adds a list of line items to a checkout.
  # @param line_items [[Inputs::CheckoutLineItem!]!] A list of line item objects to add to the checkout.
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @return [Payloads::CheckoutLineItemsAdd]
  def checkout_line_items_add(line_items:, checkout_id:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutLineItemsRemove: Removes line items from an existing checkout
  # @param checkout_id [Types::ID!] the checkout on which to remove line items
  # @param line_item_ids [[Types::ID!]!] line item ids to remove
  # @return [Payloads::CheckoutLineItemsRemove]
  def checkout_line_items_remove(checkout_id:, line_item_ids:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutLineItemsUpdate: Updates line items on a checkout.
  # @param checkout_id [Types::ID!] the checkout on which to update line items.
  # @param line_items [[Inputs::CheckoutLineItemUpdate!]!] line items to update.
  # @return [Payloads::CheckoutLineItemsUpdate]
  def checkout_line_items_update(checkout_id:, line_items:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutShippingAddressUpdate: Updates the shipping address of an existing checkout.
  # @param shipping_address [Inputs::MailingAddress!] The shipping address to where the line items will be shipped.
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @return [Payloads::CheckoutShippingAddressUpdate]
  def checkout_shipping_address_update(shipping_address:, checkout_id:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # checkoutShippingLineUpdate: Updates the shipping lines on an existing checkout.
  # @param checkout_id [Types::ID!] The ID of the checkout.
  # @param shipping_rate_handle [Types::String!] A concatenation of a Checkout’s shipping provider, price, and title, enabling the customer to select the availableShippingRates.
  # @return [Payloads::CheckoutShippingLineUpdate]
  def checkout_shipping_line_update(checkout_id:, shipping_rate_handle:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # customerAccessTokenCreate: Creates a customer access token. The customer access token is required to modify the customer object in any way.
  # @param input [Inputs::CustomerAccessTokenCreate!]
  # @return [Payloads::CustomerAccessTokenCreate]
  def customer_access_token_create(input:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # customerAccessTokenDelete: Permanently destroys a customer access token.
  # @param customer_access_token [Types::String!] The access token used to identify the customer.
  # @return [Payloads::CustomerAccessTokenDelete]
  def customer_access_token_delete(customer_access_token:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # customerAccessTokenRenew: Renews a customer access token. Access token renewal must happen *before* a token expires. If a token has already expired, a new one should be created instead via `customerAccessTokenCreate`.
  # @param customer_access_token [Types::String!] The access token used to identify the customer.
  # @return [Payloads::CustomerAccessTokenRenew]
  def customer_access_token_renew(customer_access_token:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # customerActivate: Activates a customer.
  # @param id [Types::ID!] Specifies the customer to activate.
  # @param input [Inputs::CustomerActivate!]
  # @return [Payloads::CustomerActivate]
  def customer_activate(id:, input:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # customerAddressCreate: Creates a new address for a customer.
  # @param customer_access_token [Types::String!] The access token used to identify the customer.
  # @param address [Inputs::MailingAddress!] The customer mailing address to create.
  # @return [Payloads::CustomerAddressCreate]
  def customer_address_create(customer_access_token:, address:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # customerAddressDelete: Permanently deletes the address of an existing customer.
  # @param id [Types::ID!] Specifies the address to delete.
  # @param customer_access_token [Types::String!] The access token used to identify the customer.
  # @return [Payloads::CustomerAddressDelete]
  def customer_address_delete(id:, customer_access_token:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # customerAddressUpdate: Updates the address of an existing customer.
  # @param customer_access_token [Types::String!] The access token used to identify the customer.
  # @param id [Types::ID!] Specifies the customer address to update.
  # @param address [Inputs::MailingAddress!] The customer’s mailing address.
  # @return [Payloads::CustomerAddressUpdate]
  def customer_address_update(customer_access_token:, id:, address:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # customerCreate: Creates a new customer.
  # @param input [Inputs::CustomerCreate!]
  # @return [Payloads::CustomerCreate]
  def customer_create(input:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # customerDefaultAddressUpdate: Updates the default address of an existing customer.
  # @param customer_access_token [Types::String!] The access token used to identify the customer.
  # @param address_id [Types::ID!] ID of the address to set as the new default for the customer.
  # @return [Payloads::CustomerDefaultAddressUpdate]
  def customer_default_address_update(customer_access_token:, address_id:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # customerRecover: Sends a reset password email to the customer, as the first step in the reset password process.
  # @param email [Types::String!] The email address of the customer to recover.
  # @return [Payloads::CustomerRecover]
  def customer_recover(email:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # customerReset: Resets a customer’s password with a token received from `CustomerRecover`.
  # @param id [Types::ID!] Specifies the customer to reset.
  # @param input [Inputs::CustomerReset!]
  # @return [Payloads::CustomerReset]
  def customer_reset(id:, input:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # customerResetByUrl: Resets a customer’s password with the reset password url received from `CustomerRecover`.
  # @param reset_url [Types::URL!] The customer's reset password url.
  # @param password [Types::String!] New password that will be set as part of the reset password process.
  # @return [Payloads::CustomerResetByUrl]
  def customer_reset_by_url(reset_url:, password:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end

  # customerUpdate: Updates an existing customer.
  # @param customer_access_token [Types::String!] The access token used to identify the customer.
  # @param customer [Inputs::CustomerUpdate!] The customer object input.
  # @return [Payloads::CustomerUpdate]
  def customer_update(customer_access_token:, customer:)
    raise ::Spree::GraphQL::NotImplementedError.new
  end
end