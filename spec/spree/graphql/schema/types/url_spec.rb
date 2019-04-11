# frozen_string_literal: true

require 'spec_helper'

module Spree::GraphQL
  describe 'Types::URL' do
    let!(:url) { create(:url) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) {}
  end
end
