# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::MailingAddress' do
    let!(:mailing_address) { create(:mailing_address) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # address1: The first line of the address. Typically the street address or PO Box number.
    # @return [Types::String]
    describe 'address1' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              address1
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              address1: 'String',
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

    # address2: The second line of the address. Typically the number of the apartment, suite, or unit.
    # @return [Types::String]
    describe 'address2' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              address2
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              address2: 'String',
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

    # city: The name of the city, district, village, or town.
    # @return [Types::String]
    describe 'city' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              city
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              city: 'String',
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

    # company: The name of the customer's company or organization.
    # @return [Types::String]
    describe 'company' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              company
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              company: 'String',
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

    # country: The name of the country.
    # @return [Types::String]
    describe 'country' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              country
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              country: 'String',
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

    # countryCodeV2: The two-letter code for the country of the address. For example, US.
    # @return [Types::CountryCode]
    describe 'countryCodeV2' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              countryCodeV2
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              countryCodeV2: 'AF | AX | AL | DZ | AD | AO | AI | AG | AR | AM | AW | AU | AT | AZ | BS | BH | BD | BB | BY | BE | BZ | BJ | BM | BT | BO | BQ | BA | BW | BV | BR | IO | BN | BG | BF | BI | KH | CA | CV | KY | CF | TD | CL | CN | CX | CC | CO | KM | CG | CD | CK | CR | HR | CU | CW | CY | CZ | CI | DK | DJ | DM | DO | EC | EG | SV | GQ | ER | EE | ET | FK | FO | FJ | FI | FR | GF | PF | TF | GA | GM | GE | DE | GH | GI | GR | GL | GD | GP | GT | GG | GN | GW | GY | HT | HM | VA | HN | HK | HU | IS | IN | ID | IR | IQ | IE | IM | IL | IT | JM | JP | JE | JO | KZ | KE | KI | KP | XK | KW | KG | LA | LV | LB | LS | LR | LY | LI | LT | LU | MO | MK | MG | MW | MY | MV | ML | MT | MQ | MR | MU | YT | MX | MD | MC | MN | ME | MS | MA | MZ | MM | NA | NR | NP | NL | AN | NC | NZ | NI | NE | NG | NU | NF | NO | OM | PK | PS | PA | PG | PY | PE | PH | PN | PL | PT | QA | CM | RE | RO | RU | RW | BL | SH | KN | LC | MF | PM | WS | SM | ST | SA | SN | RS | SC | SL | SG | SX | SK | SI | SB | SO | ZA | GS | KR | SS | ES | LK | VC | SD | SR | SJ | SZ | SE | CH | SY | TW | TJ | TZ | TH | TL | TG | TK | TO | TT | TN | TR | TM | TC | TV | UG | UA | AE | GB | US | UM | UY | UZ | VU | VE | VN | VG | WF | EH | YE | ZM | ZW',
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

    # firstName: The first name of the customer.
    # @return [Types::String]
    describe 'firstName' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              firstName
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
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

    # formatted: A formatted version of the address, customized by the provided arguments.
    # @param with_name [Types::Boolean] (false)
    # @param with_company [Types::Boolean] (true)
    # @return [[Types::String!]!]
    describe 'formatted' do
      let!(:query) {
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
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              formatted: ['String'],
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

    # formattedArea: A comma-separated list of the values for city, province, and country.
    # @return [Types::String]
    describe 'formattedArea' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              formattedArea
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              formattedArea: 'String',
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
            mailingAddress {
              id
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
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

    # lastName: The last name of the customer.
    # @return [Types::String]
    describe 'lastName' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              lastName
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
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

    # latitude: The latitude coordinate of the customer address.
    # @return [Types::Float]
    describe 'latitude' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              latitude
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              latitude: 'Float',
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

    # longitude: The longitude coordinate of the customer address.
    # @return [Types::Float]
    describe 'longitude' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              longitude
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              longitude: 'Float',
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

    # name: The full name of the customer, based on firstName and lastName.
    # @return [Types::String]
    describe 'name' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              name
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              name: 'String',
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

    # phone: A unique phone number for the customer. Formatted using E.164 standard. For example, _+16135551111_.
    # @return [Types::String]
    describe 'phone' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              phone
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              phone: 'String',
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

    # province: The region of the address, such as the province, state, or district.
    # @return [Types::String]
    describe 'province' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              province
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              province: 'String',
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

    # provinceCode: The two-letter code for the region. For example, ON.
    # @return [Types::String]
    describe 'provinceCode' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              provinceCode
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              provinceCode: 'String',
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

    # zip: The zip or postal code of the address.
    # @return [Types::String]
    describe 'zip' do
      let!(:query) {
        %q{
          query {
            mailingAddress {
              zip
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            mailingAddress: {
              zip: 'String',
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