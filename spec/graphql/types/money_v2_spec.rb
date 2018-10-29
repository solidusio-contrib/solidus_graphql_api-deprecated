# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::MoneyV2' do
    let!(:money_v2) { create(:money_v2) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # amount: Decimal money amount.
    # @return [Types::Decimal!]
    describe 'amount' do
      let!(:query) {
        %q{
          query {
            moneyV2 {
              amount
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            moneyV2: {
              amount: 'Decimal',
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

    # currencyCode: Currency of the money.
    # @return [Types::CurrencyCode!]
    describe 'currencyCode' do
      let!(:query) {
        %q{
          query {
            moneyV2 {
              currencyCode
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            moneyV2: {
              currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
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