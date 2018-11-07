# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::WeightUnit' do
    let!(:weight_unit) { create(:weight_unit) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end