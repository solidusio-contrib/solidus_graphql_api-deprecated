# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::DigitalWallet' do
    let!(:digital_wallet) { create(:digital_wallet) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end