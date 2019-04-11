# frozen_string_literal: true

require 'spec_helper'

module Spree::GraphQL
  describe 'Types::CurrencyCode' do
    let!(:currency_code) { create(:currency_code) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) {}
  end
end