# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::PricingValue' do
    let!(:pricing_value) { create(:pricing_value) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end