# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::ScriptDiscountApplication' do
    let!(:script_discount_application) { create(:script_discount_application) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # allocationMethod: The method by which the discount's value is allocated to its entitled items.
    # @return [Types::DiscountApplicationAllocationMethod!]
    describe 'allocationMethod' do
      let!(:query) {
        %q{
          query {
            scriptDiscountApplication {
              allocationMethod
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            scriptDiscountApplication: {
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

    # description: The description of the application as defined by the Script.
    # @return [Types::String!]
    describe 'description' do
      let!(:query) {
        %q{
          query {
            scriptDiscountApplication {
              description
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            scriptDiscountApplication: {
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
            scriptDiscountApplication {
              targetSelection
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            scriptDiscountApplication: {
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
            scriptDiscountApplication {
              targetType
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            scriptDiscountApplication: {
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
            scriptDiscountApplication {
              value
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            scriptDiscountApplication: {
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