# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Money' do
    let!(:money) { create(:money) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end