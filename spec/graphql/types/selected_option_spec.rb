# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::SelectedOption' do
    let!(:selected_option) { create(:selected_option) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # name: The product option’s name.
    # @return [Types::String!]
    describe 'name' do
      let!(:query) {
        %q{
          query {
            selectedOption {
              name
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            selectedOption: {
              name: 'String',
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

    # value: The product option’s value.
    # @return [Types::String!]
    describe 'value' do
      let!(:query) {
        %q{
          query {
            selectedOption {
              value
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            selectedOption: {
              value: 'String',
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