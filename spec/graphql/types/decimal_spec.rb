# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Decimal' do
    let!(:decimal) { create(:decimal) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end