# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::DiscountCodeApplication' do
    let!(:discount_code_application) { create(:discount_code_application) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # allocationMethod: The method by which the discount's value is allocated to its entitled items.
    # @return [Types::DiscountApplicationAllocationMethod!]
    describe 'allocationMethod' do
      let!(:query) {
        %q{
          query {
            discountCodeApplication {
              allocationMethod
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            discountCodeApplication: {
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

    # applicable: Specifies whether the discount code was applied successfully.
    # @return [Types::Boolean!]
    describe 'applicable' do
      let!(:query) {
        %q{
          query {
            discountCodeApplication {
              applicable
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            discountCodeApplication: {
              applicable: 'Boolean',
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

    # code: The string identifying the discount code that was used at the time of application.
    # @return [Types::String!]
    describe 'code' do
      let!(:query) {
        %q{
          query {
            discountCodeApplication {
              code
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            discountCodeApplication: {
              code: 'String',
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
            discountCodeApplication {
              targetSelection
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            discountCodeApplication: {
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
            discountCodeApplication {
              targetType
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            discountCodeApplication: {
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

    # value: The value of the discount application.
    # @return [Types::PricingValue!]
    describe 'value' do
      let!(:query) {
        %q{
          query {
            discountCodeApplication {
              value
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            discountCodeApplication: {
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