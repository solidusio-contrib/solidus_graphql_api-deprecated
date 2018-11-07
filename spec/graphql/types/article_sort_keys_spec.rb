# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::ArticleSortKeys' do
    let!(:article_sort_keys) { create(:article_sort_keys) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end