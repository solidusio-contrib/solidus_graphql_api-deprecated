# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::ManualDiscountApplication' do
    let!(:manual_discount_application) { create(:manual_discount_application) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # allocationMethod: The method by which the discount's value is allocated to its entitled items.
    # @return [Types::DiscountApplicationAllocationMethod!]
    describe 'allocationMethod' do
      let!(:query) {
        %q{
          query {
            manualDiscountApplication {
              allocationMethod
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            manualDiscountApplication: {
              allocationMethod: 'ACROSS | EACH | ONE',
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

    # description: The description of the application.
    # @return [Types::String]
    describe 'description' do
      let!(:query) {
        %q{
          query {
            manualDiscountApplication {
              description
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            manualDiscountApplication: {
              description: 'String',
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

    # targetSelection: Which lines of targetType that the discount is allocated over.
    # @return [Types::DiscountApplicationTargetSelection!]
    describe 'targetSelection' do
      let!(:query) {
        %q{
          query {
            manualDiscountApplication {
              targetSelection
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            manualDiscountApplication: {
              targetSelection: 'ALL | ENTITLED | EXPLICIT',
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

    # targetType: The type of line that the discount is applicable towards.
    # @return [Types::DiscountApplicationTargetType!]
    describe 'targetType' do
      let!(:query) {
        %q{
          query {
            manualDiscountApplication {
              targetType
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            manualDiscountApplication: {
              targetType: 'LINE_ITEM | SHIPPING_LINE',
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

    # title: The title of the application.
    # @return [Types::String!]
    describe 'title' do
      let!(:query) {
        %q{
          query {
            manualDiscountApplication {
              title
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            manualDiscountApplication: {
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

    # value: The value of the discount application.
    # @return [Types::PricingValue!]
    describe 'value' do
      let!(:query) {
        %q{
          query {
            manualDiscountApplication {
              value
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            manualDiscountApplication: {
              value: PricingPercentageValue | MoneyV2,
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