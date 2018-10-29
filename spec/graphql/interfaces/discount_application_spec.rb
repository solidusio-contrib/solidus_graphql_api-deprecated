# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Interfaces::DiscountApplication' do
    let!(:discount_application) { create(:discount_application) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # allocationMethod: The method by which the discount's value is allocated to its entitled items.
    # @return [Types::DiscountApplicationAllocationMethod!]
    describe 'allocationMethod' do
      let!(:query) {
        %q{
          query {
            discountApplication {
              allocationMethod
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            discountApplication: {
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

    # targetSelection: Which lines of targetType that the discount is allocated over.
    # @return [Types::DiscountApplicationTargetSelection!]
    describe 'targetSelection' do
      let!(:query) {
        %q{
          query {
            discountApplication {
              targetSelection
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            discountApplication: {
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
            discountApplication {
              targetType
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            discountApplication: {
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
            discountApplication {
              value
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            discountApplication: {
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