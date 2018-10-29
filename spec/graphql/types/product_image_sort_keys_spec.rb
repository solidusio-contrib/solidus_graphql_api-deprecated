# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::ProductImageSortKeys' do
    let!(:product_image_sort_keys) { create(:product_image_sort_keys) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end