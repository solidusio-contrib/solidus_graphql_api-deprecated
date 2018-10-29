# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::CropRegion' do
    let!(:crop_region) { create(:crop_region) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end