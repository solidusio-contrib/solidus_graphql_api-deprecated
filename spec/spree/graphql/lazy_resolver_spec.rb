# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::GraphQL::LazyResolver do
  describe '.adapter' do
    include_context 'when the lazy resolver adapter is BatchLoader' do
      subject(:returned_value) { described_class.adapter }

      it { is_expected.to eq Spree::GraphQL::LazyResolver::Adapters::BatchLoaderAdapter }
    end
  end

  described_class::METHODS_DELEGATED_TO_ADAPTER.each do |delegated_method|
    describe ".#{delegated_method}" do
      include_context 'when the lazy resolver adapter is BatchLoader' do
        it 'gets delegated to the adapter' do
          expect(described_class.adapter).to receive(delegated_method)
          described_class.send delegated_method
        end
      end
    end
  end
end
