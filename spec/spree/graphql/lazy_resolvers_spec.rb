# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::GraphQL::LazyResolvers do
  describe '.for' do
    subject(:returned_value) { described_class.for graphql_type_class }

    include_context 'when the lazy resolver adapter is BatchLoader' do
      context 'when it gets called with a GraphQL type class having a related lazy resolver' do
        let(:graphql_type_class) { Spree::GraphQL::Schema::Types::Product }

        it 'returns the related lazy resolver' do
          expect(returned_value).to eq Spree::GraphQL::LazyResolvers::BatchLoader::Product
        end
      end
    end
  end
end
