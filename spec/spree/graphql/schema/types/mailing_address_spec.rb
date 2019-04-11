# frozen_string_literal: true

require 'spec_helper'

class Spree::GraphQL::Schema::Types::QueryRoot < Spree::GraphQL::Schema::Types::BaseObject
  field :test_address, ::Spree::GraphQL::Schema::Types::MailingAddress, null: false

  def test_address
    country = ::Spree::Country.first
    province = country.states.find_by(abbr: 'AL')

    ::Spree::Address.new \
      address1: 'Address 1',
      address2: 'Address 2',
      city: 'City',
      company: 'Company Name',
      country: country,
      firstname: 'John',
      lastname: 'Doe',
      phone: '0123456789',
      state: province,
      zipcode: '10000'
  end
end

module Spree::GraphQL
  describe 'Types::MailingAddress' do
    let!(:state) { create(:state) }
    let!(:country) { state.country }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) {}

    describe 'fields' do
      let!(:query) do
        %q{
          query {
            testAddress {
              address1
              address2
              city
              company
              country
              countryCodeV2
              firstName
              lastName
              phone
              province
              provinceCode
              zip
              formattedArea
              name
            }
          }
        }
      end
      let!(:result) do
        {
          data: {
            testAddress: {
              address1: 'Address 1',
              address2: 'Address 2',
              city: 'City',
              company: 'Company Name',
              country: country.name,
              countryCodeV2: country.iso,
              firstName: 'John',
              lastName: 'Doe',
              phone: '0123456789',
              province: state.name,
              provinceCode: state.abbr,
              zip: '10000',
              formattedArea: ['City', state.name, country.name].join(', '),
              name: 'John Doe'
            }
          }
          # errors: {},
        }
      end

      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    # formatted: A formatted version of the address, customized by the provided arguments.
    # @param with_name [Types::Boolean] (false)
    # @param with_company [Types::Boolean] (true)
    # @return [[Types::String!]!]
    describe 'formatted' do
      let!(:query) do
        %q{
          query {
            mailingAddress {
              formatted(
                withName: false,
                withCompany: true
              )
            }
          }
        }
      end
      let!(:result) do
        {
          data: {
            mailingAddress: {
              formatted: ['String']
            }
          }
          # errors: {},
        }
      end
      # it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      # end
    end

    # latitude: The latitude coordinate of the customer address.
    # @return [Types::Float]
    describe 'latitude' do
      let!(:query) do
        %q{
          query {
            mailingAddress {
              latitude
            }
          }
        }
      end
      let!(:result) do
        {
          data: {
            mailingAddress: {
              latitude: 'Float'
            }
          }
          # errors: {},
        }
      end
      # it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      # end
    end

    # longitude: The longitude coordinate of the customer address.
    # @return [Types::Float]
    describe 'longitude' do
      let!(:query) do
        %q{
          query {
            mailingAddress {
              longitude
            }
          }
        }
      end
      let!(:result) do
        {
          data: {
            mailingAddress: {
              longitude: 'Float'
            }
          }
          # errors: {},
        }
      end
      # it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      # end
    end
  end
end
