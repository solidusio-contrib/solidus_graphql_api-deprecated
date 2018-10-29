# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::CustomerErrorCode' do
    let!(:customer_error_code) { create(:customer_error_code) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end