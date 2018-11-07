# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::DateTime' do
    let!(:date_time) { create(:date_time) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end