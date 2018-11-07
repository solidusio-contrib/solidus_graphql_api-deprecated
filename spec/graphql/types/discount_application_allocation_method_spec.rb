# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::DiscountApplicationAllocationMethod' do
    let!(:discount_application_allocation_method) { create(:discount_application_allocation_method) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end