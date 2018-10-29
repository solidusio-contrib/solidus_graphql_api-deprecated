# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::CustomerUserError' do
    let!(:customer_user_error) { create(:customer_user_error) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # code: Error code to uniquely identify the error.
    # @return [Types::CustomerErrorCode]
    describe 'code' do
      let!(:query) {
        %q{
          query {
            customerUserError {
              code
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerUserError: {
              code: 'BLANK | INVALID | TAKEN | TOO_LONG | TOO_SHORT | UNIDENTIFIED_CUSTOMER | CUSTOMER_DISABLED | PASSWORD_STARTS_OR_ENDS_WITH_WHITESPACE | CONTAINS_HTML_TAGS | CONTAINS_URL',
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
            customerUserError {
              field
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerUserError: {
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
            customerUserError {
              message
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerUserError: {
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