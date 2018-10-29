# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::PageInfo' do
    let!(:page_info) { create(:page_info) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # hasNextPage: Indicates if there are more pages to fetch.
    # @return [Types::Boolean!]
    describe 'hasNextPage' do
      let!(:query) {
        %q{
          query {
            pageInfo {
              hasNextPage
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            pageInfo: {
              hasNextPage: 'Boolean',
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

    # hasPreviousPage: Indicates if there are any pages prior to the current page.
    # @return [Types::Boolean!]
    describe 'hasPreviousPage' do
      let!(:query) {
        %q{
          query {
            pageInfo {
              hasPreviousPage
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            pageInfo: {
              hasPreviousPage: 'Boolean',
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