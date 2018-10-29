# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Domain' do
    let!(:domain) { create(:domain) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # host: The host name of the domain (eg: `example.com`).
    # @return [Types::String!]
    describe 'host' do
      let!(:query) {
        %q{
          query {
            domain {
              host
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            domain: {
              host: 'String',
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

    # sslEnabled: Whether SSL is enabled or not.
    # @return [Types::Boolean!]
    describe 'sslEnabled' do
      let!(:query) {
        %q{
          query {
            domain {
              sslEnabled
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            domain: {
              sslEnabled: 'Boolean',
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

    # url: The URL of the domain (eg: `https://example.com`).
    # @return [Types::URL!]
    describe 'url' do
      let!(:query) {
        %q{
          query {
            domain {
              url
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            domain: {
              url: 'URL',
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