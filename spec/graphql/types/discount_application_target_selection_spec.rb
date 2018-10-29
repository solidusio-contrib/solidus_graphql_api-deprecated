# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::DiscountApplicationTargetSelection' do
    let!(:discount_application_target_selection) { create(:discount_application_target_selection) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end