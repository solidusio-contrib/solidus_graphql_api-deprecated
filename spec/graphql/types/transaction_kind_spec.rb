# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::TransactionKind' do
    let!(:transaction_kind) { create(:transaction_kind) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end