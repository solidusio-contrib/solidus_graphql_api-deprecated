# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::TransactionStatus' do
    let!(:transaction_status) { create(:transaction_status) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end