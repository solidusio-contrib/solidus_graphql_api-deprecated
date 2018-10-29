# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::OrderSortKeys' do
    let!(:order_sort_keys) { create(:order_sort_keys) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end