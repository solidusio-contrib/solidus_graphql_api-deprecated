# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Interfaces::DisplayableError' do
    let!(:displayable_error) { create(:displayable_error) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # field: Path to the input field which caused the error.
    # @return [[Types::String!]]
    describe 'field' do
      let!(:query) {
        %q{
          query {
            displayableError {
              field
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            displayableError: {
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
            displayableError {
              message
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            displayableError: {
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