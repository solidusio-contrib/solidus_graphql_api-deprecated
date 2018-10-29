# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::ProductOption' do
    let!(:product_option) { create(:product_option) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # id: Globally unique identifier.
    # @return [Types::ID!]
    describe 'id' do
      let!(:query) {
        %q{
          query {
            productOption {
              id
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            productOption: {
              id: 'ID',
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

    # name: The product option’s name.
    # @return [Types::String!]
    describe 'name' do
      let!(:query) {
        %q{
          query {
            productOption {
              name
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            productOption: {
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

    # values: The corresponding value to the product option name.
    # @return [[Types::String!]!]
    describe 'values' do
      let!(:query) {
        %q{
          query {
            productOption {
              values
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            productOption: {
              values: ['String'],
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