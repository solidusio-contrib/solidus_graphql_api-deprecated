# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::PricingPercentageValue' do
    let!(:pricing_percentage_value) { create(:pricing_percentage_value) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # percentage: The percentage value of the object.
    # @return [Types::Float!]
    describe 'percentage' do
      let!(:query) {
        %q{
          query {
            pricingPercentageValue {
              percentage
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            pricingPercentageValue: {
              percentage: 'Float',
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