# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::BlogSortKeys' do
    let!(:blog_sort_keys) { create(:blog_sort_keys) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end