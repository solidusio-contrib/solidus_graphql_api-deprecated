# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::CountryCode' do
    let!(:country_code) { create(:country_code) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end