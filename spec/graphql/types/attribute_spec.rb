# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Attribute' do
    let!(:attribute) { create(:attribute) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # key: Key or name of the attribute.
    # @return [Types::String!]
    describe 'key' do
      let!(:query) {
        %q{
          query {
            attribute {
              key
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            attribute: {
              key: 'String',
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

    # value: Value of the attribute.
    # @return [Types::String]
    describe 'value' do
      let!(:query) {
        %q{
          query {
            attribute {
              value
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            attribute: {
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