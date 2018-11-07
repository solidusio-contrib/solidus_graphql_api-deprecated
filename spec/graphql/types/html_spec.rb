# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::HTML' do
    let!(:html) { create(:html) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end