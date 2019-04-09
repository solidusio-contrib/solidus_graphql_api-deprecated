# frozen_string_literal: true

require 'spec_helper'

module Spree::GraphQL
  describe 'Types::PaymentSettings' do
    let!(:payment_settings) { create(:payment_settings) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # acceptedCardBrands: List of the card brands which the shop accepts.
    # @return [[Types::CardBrand!]!]
    describe 'acceptedCardBrands' do
      let!(:query) {
        %q{
          query {
            paymentSettings {
              acceptedCardBrands
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            paymentSettings: {
              acceptedCardBrands: ['VISA | MASTERCARD | DISCOVER | AMERICAN_EXPRESS | DINERS_CLUB | JCB'],
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

    # cardVaultUrl: The url pointing to the endpoint to vault credit cards.
    # @return [Types::URL!]
    describe 'cardVaultUrl' do
      let!(:query) {
        %q{
          query {
            paymentSettings {
              cardVaultUrl
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            paymentSettings: {
              cardVaultUrl: 'URL',
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

    # countryCode: The country where the shop is located.
    # @return [Types::CountryCode!]
    describe 'countryCode' do
      let!(:query) {
        %q{
          query {
            paymentSettings {
              countryCode
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            paymentSettings: {
              countryCode: 'AF | AX | AL | DZ | AD | AO | AI | AG | AR | AM | AW | AU | AT | AZ | BS | BH | BD | BB | BY | BE | BZ | BJ | BM | BT | BO | BQ | BA | BW | BV | BR | IO | BN | BG | BF | BI | KH | CA | CV | KY | CF | TD | CL | CN | CX | CC | CO | KM | CG | CD | CK | CR | HR | CU | CW | CY | CZ | CI | DK | DJ | DM | DO | EC | EG | SV | GQ | ER | EE | ET | FK | FO | FJ | FI | FR | GF | PF | TF | GA | GM | GE | DE | GH | GI | GR | GL | GD | GP | GT | GG | GN | GW | GY | HT | HM | VA | HN | HK | HU | IS | IN | ID | IR | IQ | IE | IM | IL | IT | JM | JP | JE | JO | KZ | KE | KI | KP | XK | KW | KG | LA | LV | LB | LS | LR | LY | LI | LT | LU | MO | MK | MG | MW | MY | MV | ML | MT | MQ | MR | MU | YT | MX | MD | MC | MN | ME | MS | MA | MZ | MM | NA | NR | NP | NL | AN | NC | NZ | NI | NE | NG | NU | NF | NO | OM | PK | PS | PA | PG | PY | PE | PH | PN | PL | PT | QA | CM | RE | RO | RU | RW | BL | SH | KN | LC | MF | PM | WS | SM | ST | SA | SN | RS | SC | SL | SG | SX | SK | SI | SB | SO | ZA | GS | KR | SS | ES | LK | VC | SD | SR | SJ | SZ | SE | CH | SY | TW | TJ | TZ | TH | TL | TG | TK | TO | TT | TN | TR | TM | TC | TV | UG | UA | AE | GB | US | UM | UY | UZ | VU | VE | VN | VG | WF | EH | YE | ZM | ZW',
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

    # currencyCode: The three-letter code for the currency that the shop accepts.
    # @return [Types::CurrencyCode!]
    describe 'currencyCode' do
      let!(:query) {
        %q{
          query {
            paymentSettings {
              currencyCode
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            paymentSettings: {
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

    # solidusPaymentsAccountId: The shop’s Solidus Payments account id.
    # @return [Types::String]
    describe 'solidusPaymentsAccountId' do
      let!(:query) {
        %q{
          query {
            paymentSettings {
              solidusPaymentsAccountId
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            paymentSettings: {
              solidusPaymentsAccountId: 'String',
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

    # supportedDigitalWallets: List of the digital wallets which the shop supports.
    # @return [[Types::DigitalWallet!]!]
    describe 'supportedDigitalWallets' do
      let!(:query) {
        %q{
          query {
            paymentSettings {
              supportedDigitalWallets
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            paymentSettings: {
              supportedDigitalWallets: ['APPLE_PAY | ANDROID_PAY | GOOGLE_PAY | SOLIDUS_PAY'],
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