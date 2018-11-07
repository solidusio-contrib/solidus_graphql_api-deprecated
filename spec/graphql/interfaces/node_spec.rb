# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Interfaces::Node' do
    let!(:node) { create(:node) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # id: Globally unique identifier.
    # @return [Types::ID!]
    describe 'id' do
      let!(:query) {
        %q{
          query {
            node {
              id
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            node: {
              id: 'ID',
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end
  end
end