# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::CheckoutErrorCode' do
    let!(:checkout_error_code) { create(:checkout_error_code) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end