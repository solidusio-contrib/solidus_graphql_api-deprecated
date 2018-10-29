# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::CheckoutUserError' do
    let!(:checkout_user_error) { create(:checkout_user_error) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # code: Error code to uniquely identify the error.
    # @return [Types::CheckoutErrorCode]
    describe 'code' do
      let!(:query) {
        %q{
          query {
            checkoutUserError {
              code
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutUserError: {
              code: 'BLANK | INVALID | TOO_LONG | PRESENT | LESS_THAN | ALREADY_COMPLETED | LOCKED | NOT_SUPPORTED | INVALID_FOR_COUNTRY_AND_PROVINCE | INVALID_STATE_IN_COUNTRY | INVALID_PROVINCE_IN_COUNTRY | INVALID_REGION_IN_COUNTRY | SHIPPING_RATE_EXPIRED | GIFT_CARD_UNUSABLE | CART_DOES_NOT_MEET_DISCOUNT_REQUIREMENTS_NOTICE | DISCOUNT_EXPIRED | DISCOUNT_DISABLED | DISCOUNT_LIMIT_REACHED | DISCOUNT_NOT_FOUND | CUSTOMER_ALREADY_USED_ONCE_PER_CUSTOMER_DISCOUNT_NOTICE | EMPTY | NOT_ENOUGH_IN_STOCK',
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # field: Path to the input field which caused the error.
    # @return [[Types::String!]]
    describe 'field' do
      let!(:query) {
        %q{
          query {
            checkoutUserError {
              field
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutUserError: {
              field: ['String'],
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # message: The error message.
    # @return [Types::String!]
    describe 'message' do
      let!(:query) {
        %q{
          query {
            checkoutUserError {
              message
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutUserError: {
              message: 'String',
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end
  end
end