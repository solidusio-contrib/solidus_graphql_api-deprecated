# frozen_string_literal: true

require 'spec_helper'

class Spree::GraphQL::Schema::Types::QueryRoot < Spree::GraphQL::Schema::Types::BaseObject
  field :test_credit_card, ::Spree::GraphQL::Schema::Types::CreditCard, null: false

  def test_credit_card
    context[:credit_card]
  end
end

module Spree::GraphQL
  describe 'Types::CreditCard' do
    let!(:credit_card) { create(:credit_card) { |c| c.cc_type = 'VISA' } }
    let!(:variables) { }
    let!(:ctx) { { credit_card: credit_card } }

    describe 'brand' do
      let!(:query) {
        %q{
          query {
            testCreditCard {
              brand
              expiryMonth
              expiryYear
              firstName
              lastDigits
              lastName
              maskedNumber
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            testCreditCard: {
              brand: 'VISA',
              expiryMonth: credit_card.month.to_i,
              expiryYear: credit_card.year.to_i,
              lastDigits: credit_card.last_digits,
              firstName: 'Spree',
              lastName: 'Commerce',
              maskedNumber: 'XXXX-XXXX-XXXX-1111',
            }
          },
          #errors: {},
        }
      }
      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    # firstDigits
    # @return [Types::String]
    describe 'firstDigits' do
      let!(:query) {
        %q{
          query {
            creditCard {
              firstDigits
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            creditCard: {
              firstDigits: 'String',
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
