# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::ImageContentType' do
    let!(:image_content_type) { create(:image_content_type) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }
  end
end