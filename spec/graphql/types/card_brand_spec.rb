# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::CardBrand' do
    let!(:card_brand) { create(:card_brand) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end