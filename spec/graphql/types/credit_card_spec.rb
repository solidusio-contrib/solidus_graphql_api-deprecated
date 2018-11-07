# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::CreditCard' do
    let!(:credit_card) { create(:credit_card) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # brand
    # @return [Types::String]
    describe 'brand' do
      let!(:query) {
        %q{
          query {
            creditCard {
              brand
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            creditCard: {
              brand: 'String',
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

    # expiryMonth
    # @return [Types::Int]
    describe 'expiryMonth' do
      let!(:query) {
        %q{
          query {
            creditCard {
              expiryMonth
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            creditCard: {
              expiryMonth: 'Int',
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

    # expiryYear
    # @return [Types::Int]
    describe 'expiryYear' do
      let!(:query) {
        %q{
          query {
            creditCard {
              expiryYear
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            creditCard: {
              expiryYear: 'Int',
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

    # firstName
    # @return [Types::String]
    describe 'firstName' do
      let!(:query) {
        %q{
          query {
            creditCard {
              firstName
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            creditCard: {
              firstName: 'String',
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

    # lastDigits
    # @return [Types::String]
    describe 'lastDigits' do
      let!(:query) {
        %q{
          query {
            creditCard {
              lastDigits
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            creditCard: {
              lastDigits: 'String',
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

    # lastName
    # @return [Types::String]
    describe 'lastName' do
      let!(:query) {
        %q{
          query {
            creditCard {
              lastName
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            creditCard: {
              lastName: 'String',
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

    # maskedNumber: Masked credit card number with only the last 4 digits displayed
    # @return [Types::String]
    describe 'maskedNumber' do
      let!(:query) {
        %q{
          query {
            creditCard {
              maskedNumber
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            creditCard: {
              maskedNumber: 'String',
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