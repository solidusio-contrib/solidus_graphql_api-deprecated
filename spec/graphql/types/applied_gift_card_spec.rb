# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::AppliedGiftCard' do
    let!(:applied_gift_card) { create(:applied_gift_card) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # amountUsed: The amount that was used taken from the Gift Card by applying it.
    # @return [Types::Money!]
    describe 'amountUsed' do
      let!(:query) {
        %q{
          query {
            appliedGiftCard {
              amountUsed
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            appliedGiftCard: {
              amountUsed: 'Money',
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

    # balance: The amount left on the Gift Card.
    # @return [Types::Money!]
    describe 'balance' do
      let!(:query) {
        %q{
          query {
            appliedGiftCard {
              balance
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            appliedGiftCard: {
              balance: 'Money',
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

    # id: Globally unique identifier.
    # @return [Types::ID!]
    describe 'id' do
      let!(:query) {
        %q{
          query {
            appliedGiftCard {
              id
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            appliedGiftCard: {
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

    # lastCharacters: The last characters of the Gift Card code
    # @return [Types::String!]
    describe 'lastCharacters' do
      let!(:query) {
        %q{
          query {
            appliedGiftCard {
              lastCharacters
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            appliedGiftCard: {
              lastCharacters: 'String',
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