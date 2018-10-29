# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::UserError' do
    let!(:user_error) { create(:user_error) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # field: Path to the input field which caused the error.
    # @return [[Types::String!]]
    describe 'field' do
      let!(:query) {
        %q{
          query {
            userError {
              field
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            userError: {
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
            userError {
              message
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            userError: {
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