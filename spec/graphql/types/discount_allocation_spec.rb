# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::DiscountAllocation' do
    let!(:discount_allocation) { create(:discount_allocation) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # allocatedAmount: Amount of discount allocated.
    # @return [Types::MoneyV2!]
    describe 'allocatedAmount' do
      let!(:query) {
        %q{
          query {
            discountAllocation {
              allocatedAmount {
                amount
                currencyCode
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            discountAllocation: {
              allocatedAmount: {
                amount: 'Decimal',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
              },
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

    # discountApplication: The discount this allocated amount originated from.
    # @return [Interfaces::DiscountApplication!]
    describe 'discountApplication' do
      let!(:query) {
        %q{
          query {
            discountAllocation {
              discountApplication {
                allocationMethod
                targetSelection
                targetType
                value
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            discountAllocation: {
              discountApplication: {
                allocationMethod: 'ACROSS | EACH | ONE',
                targetSelection: 'ALL | ENTITLED | EXPLICIT',
                targetType: 'LINE_ITEM | SHIPPING_LINE',
                value: PricingPercentageValue | MoneyV2,
              },
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