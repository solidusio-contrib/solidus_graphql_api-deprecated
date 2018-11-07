# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Transaction' do
    let!(:transaction) { create(:transaction) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # amount: The amount of money that the transaction was for.
    # @return [Types::Money!]
    describe 'amount' do
      let!(:query) {
        %q{
          query {
            transaction {
              amount
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            transaction: {
              amount: 'Money',
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

    # kind: The kind of the transaction.
    # @return [Types::TransactionKind!]
    describe 'kind' do
      let!(:query) {
        %q{
          query {
            transaction {
              kind
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            transaction: {
              kind: 'SALE | CAPTURE | AUTHORIZATION | EMV_AUTHORIZATION | CHANGE',
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

    # status: The status of the transaction
    # @return [Types::TransactionStatus!]
    describe 'status' do
      let!(:query) {
        %q{
          query {
            transaction {
              status
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            transaction: {
              status: 'PENDING | SUCCESS | FAILURE | ERROR',
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

    # test: Whether the transaction was done in test mode or not
    # @return [Types::Boolean!]
    describe 'test' do
      let!(:query) {
        %q{
          query {
            transaction {
              test
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            transaction: {
              test: 'Boolean',
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