# frozen_string_literal: true

require 'spec_helper'

module Spree::GraphQL
  describe 'Types::QueryRoot' do
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    let!(:products) { create_list(:product, 2) }

    # node
    # @param id [Types::ID!]
    # @return [Interfaces::Node]
    describe 'node' do
      let(:product_id) { ::Spree::GraphQL::Schema::Schema.id_from_object(products.first) }
      let(:variables) { { product_id: product_id } }
      let!(:query) {
        %q{
          query node($product_id: ID!) {
            node(id: $product_id) {
              id
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            node: {
              id: 'To be filled in'
            },
          },
          #errors: {},
        }
      }
      it 'succeeds' do
        execute
        result[:data][:node][:id] = product_id
        expect(response_hash).to eq(result_hash)
      end
    end

    # nodes
    # @param ids [[Types::ID!]!]
    # @return [[Interfaces::Node]!]
    describe 'nodes' do
      let(:product_id_1) { ::Spree::GraphQL::Schema::Schema.id_from_object(products.first) }
      let(:product_id_2) { ::Spree::GraphQL::Schema::Schema.id_from_object(products.second) }
      let(:variables) { { product_id_1: product_id_1, product_id_2: product_id_2 } }
      let!(:query) {
        %q{
          query nodes($product_id_1: ID!, $product_id_2: ID!) {
            nodes(ids: [$product_id_1, $product_id_2]) {
              id
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            nodes: [{
              id: 'To be filled in'
            },
            {
              id: 'To be filled in'
            }],
          },
          #errors: {},
        }
      }
      it 'succeeds' do
        execute
        result[:data][:nodes][0][:id] = product_id_1
        result[:data][:nodes][1][:id] = product_id_2
        expect(response_hash).to eq(result_hash)
      end
    end
  end
end
