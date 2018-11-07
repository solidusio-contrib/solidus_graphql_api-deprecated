# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::DiscountApplicationTargetType' do
    let!(:discount_application_target_type) { create(:discount_application_target_type) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end