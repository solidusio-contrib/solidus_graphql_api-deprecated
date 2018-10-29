# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::ShippingRate' do
    let!(:shipping_rate) { create(:shipping_rate) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # handle: Human-readable unique identifier for this shipping rate.
    # @return [Types::String!]
    describe 'handle' do
      let!(:query) {
        %q{
          query {
            shippingRate {
              handle
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            shippingRate: {
              handle: 'String',
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

    # price: Price of this shipping rate.
    # @return [Types::Money!]
    describe 'price' do
      let!(:query) {
        %q{
          query {
            shippingRate {
              price
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            shippingRate: {
              price: 'Money',
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

    # title: Title of this shipping rate.
    # @return [Types::String!]
    describe 'title' do
      let!(:query) {
        %q{
          query {
            shippingRate {
              title
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            shippingRate: {
              title: 'String',
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