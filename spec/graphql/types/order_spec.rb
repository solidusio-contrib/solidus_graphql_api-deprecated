# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Order' do
    let!(:order) { create(:order) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # currencyCode: The code of the currency used for the payment.
    # @return [Types::CurrencyCode!]
    describe 'currencyCode' do
      let!(:query) {
        %q{
          query {
            order {
              currencyCode
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
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

    # customerLocale: The locale code in which this specific order happened.
    # @return [Types::String]
    describe 'customerLocale' do
      let!(:query) {
        %q{
          query {
            order {
              customerLocale
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              customerLocale: 'String',
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

    # customerUrl: The unique URL that the customer can use to access the order.
    # @return [Types::URL]
    describe 'customerUrl' do
      let!(:query) {
        %q{
          query {
            order {
              customerUrl
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              customerUrl: 'URL',
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

    # discountApplications: Discounts that have been applied on the order.
    # @param reverse [Types::Boolean] (false)
    # @return [Interfaces::DiscountApplication.connection_type!]
    describe 'discountApplications' do
      let!(:query) {
        %q{
          query {
            order {
              discountApplications(
                first: Int,
                after: "",
                last: Int,
                before: "",
                reverse: false
              ) {
                edges {
                  node {
                    allocationMethod
                    targetSelection
                    targetType
                    value
                  }
                }
                pageInfo {
                  hasNextPage
                  hasPreviousPage
                }
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              discountApplications: {
                edges: {
                  node: [{
                    allocationMethod: 'ACROSS | EACH | ONE',
                    targetSelection: 'ALL | ENTITLED | EXPLICIT',
                    targetType: 'LINE_ITEM | SHIPPING_LINE',
                    value: PricingPercentageValue | MoneyV2,
                  }],
                },
                pageInfo: {
                  hasNextPage: true,
                  hasPreviousPage: false,
                },
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

    # email: The customer's email address.
    # @return [Types::String]
    describe 'email' do
      let!(:query) {
        %q{
          query {
            order {
              email
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              email: 'String',
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
            order {
              id
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
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

    # lineItems: List of the order’s line items.
    # @param reverse [Types::Boolean] (false)
    # @return [Types::OrderLineItem.connection_type!]
    describe 'lineItems' do
      let!(:query) {
        %q{
          query {
            order {
              lineItems(
                first: Int,
                after: "",
                last: Int,
                before: "",
                reverse: false
              ) {
                edges {
                  node {
                    customAttributes {
                      key
                      value
                    }
                    discountAllocations {
                      allocatedAmount {
                        # ...
                      }
                      discountApplication {
                        # ...
                      }
                    }
                    quantity
                    title
                    variant {
                      available
                      availableForSale
                      compareAtPrice
                      id
                      image(
                        maxWidth: Int,
                        maxHeight: Int,
                        crop: "CENTER | TOP | BOTTOM | LEFT | RIGHT",
                        scale: Int
                      ) {
                        # ...
                      }
                      price
                      product {
                        # ...
                      }
                      selectedOptions {
                        # ...
                      }
                      sku
                      title
                      weight
                      weightUnit
                    }
                  }
                }
                pageInfo {
                  hasNextPage
                  hasPreviousPage
                }
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              lineItems: {
                edges: {
                  node: [{
                    customAttributes: {
                      key: 'String',
                      value: 'String',
                    },
                    discountAllocations: {
                      allocatedAmount: {
                        # ...
                      },
                      discountApplication: {
                        # ...
                      },
                    },
                    quantity: 'Int',
                    title: 'String',
                    variant: {
                      available: 'Boolean',
                      availableForSale: 'Boolean',
                      compareAtPrice: 'Money',
                      id: 'ID',
                      image: {
                        # ...
                      },
                      price: 'Money',
                      product: {
                        # ...
                      },
                      selectedOptions: {
                        # ...
                      },
                      sku: 'String',
                      title: 'String',
                      weight: 'Float',
                      weightUnit: 'KILOGRAMS | GRAMS | POUNDS | OUNCES',
                    },
                  }],
                },
                pageInfo: {
                  hasNextPage: true,
                  hasPreviousPage: false,
                },
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

    # name: Unique identifier for the order that appears on the order. For example, _#1000_ or _Store1001.
    # @return [Types::String!]
    describe 'name' do
      let!(:query) {
        %q{
          query {
            order {
              name
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
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

    # orderNumber: A unique numeric identifier for the order for use by shop owner and customer.
    # @return [Types::Int!]
    describe 'orderNumber' do
      let!(:query) {
        %q{
          query {
            order {
              orderNumber
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              orderNumber: 'Int',
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

    # phone: The customer's phone number.
    # @return [Types::String]
    describe 'phone' do
      let!(:query) {
        %q{
          query {
            order {
              phone
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
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

    # processedAt: The date and time when the order was imported. This value can be set to dates in the past when importing from other systems. If no value is provided, it will be auto-generated based on current date and time.
    # @return [Types::DateTime!]
    describe 'processedAt' do
      let!(:query) {
        %q{
          query {
            order {
              processedAt
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              processedAt: 'DateTime',
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

    # shippingAddress: The address to where the order will be shipped.
    # @return [Types::MailingAddress]
    describe 'shippingAddress' do
      let!(:query) {
        %q{
          query {
            order {
              shippingAddress {
                address1
                address2
                city
                company
                country
                countryCode
                countryCodeV2
                firstName
                formatted(
                  withName: false,
                  withCompany: true
                )
                formattedArea
                id
                lastName
                latitude
                longitude
                name
                phone
                province
                provinceCode
                zip
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              shippingAddress: {
                address1: 'String',
                address2: 'String',
                city: 'String',
                company: 'String',
                country: 'String',
                countryCode: 'String',
                countryCodeV2: 'AF | AX | AL | DZ | AD | AO | AI | AG | AR | AM | AW | AU | AT | AZ | BS | BH | BD | BB | BY | BE | BZ | BJ | BM | BT | BO | BQ | BA | BW | BV | BR | IO | BN | BG | BF | BI | KH | CA | CV | KY | CF | TD | CL | CN | CX | CC | CO | KM | CG | CD | CK | CR | HR | CU | CW | CY | CZ | CI | DK | DJ | DM | DO | EC | EG | SV | GQ | ER | EE | ET | FK | FO | FJ | FI | FR | GF | PF | TF | GA | GM | GE | DE | GH | GI | GR | GL | GD | GP | GT | GG | GN | GW | GY | HT | HM | VA | HN | HK | HU | IS | IN | ID | IR | IQ | IE | IM | IL | IT | JM | JP | JE | JO | KZ | KE | KI | KP | XK | KW | KG | LA | LV | LB | LS | LR | LY | LI | LT | LU | MO | MK | MG | MW | MY | MV | ML | MT | MQ | MR | MU | YT | MX | MD | MC | MN | ME | MS | MA | MZ | MM | NA | NR | NP | NL | AN | NC | NZ | NI | NE | NG | NU | NF | NO | OM | PK | PS | PA | PG | PY | PE | PH | PN | PL | PT | QA | CM | RE | RO | RU | RW | BL | SH | KN | LC | MF | PM | WS | SM | ST | SA | SN | RS | SC | SL | SG | SX | SK | SI | SB | SO | ZA | GS | KR | SS | ES | LK | VC | SD | SR | SJ | SZ | SE | CH | SY | TW | TJ | TZ | TH | TL | TG | TK | TO | TT | TN | TR | TM | TC | TV | UG | UA | AE | GB | US | UM | UY | UZ | VU | VE | VN | VG | WF | EH | YE | ZM | ZW',
                firstName: 'String',
                formatted: 'String',
                formattedArea: 'String',
                id: 'ID',
                lastName: 'String',
                latitude: 'Float',
                longitude: 'Float',
                name: 'String',
                phone: 'String',
                province: 'String',
                provinceCode: 'String',
                zip: 'String',
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

    # shippingDiscountAllocations: The discounts that have been allocated onto the shipping line by discount applications.
    # @return [[Types::DiscountAllocation!]!]
    describe 'shippingDiscountAllocations' do
      let!(:query) {
        %q{
          query {
            order {
              shippingDiscountAllocations {
                allocatedAmount {
                  amount
                  currencyCode
                }
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
      }
      let!(:result) {
        {
          data: {
            order: {
              shippingDiscountAllocations: [{
                allocatedAmount: {
                  amount: 'Decimal',
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                },
                discountApplication: {
                  allocationMethod: 'ACROSS | EACH | ONE',
                  targetSelection: 'ALL | ENTITLED | EXPLICIT',
                  targetType: 'LINE_ITEM | SHIPPING_LINE',
                  value: PricingPercentageValue | MoneyV2,
                },
              }],
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

    # statusUrl: The unique URL for the order's status page.
    # @return [Types::URL!]
    describe 'statusUrl' do
      let!(:query) {
        %q{
          query {
            order {
              statusUrl
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              statusUrl: 'URL',
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

    # subtotalPrice: Price of the order before shipping and taxes.
    # @return [Types::Money]
    describe 'subtotalPrice' do
      let!(:query) {
        %q{
          query {
            order {
              subtotalPrice
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              subtotalPrice: 'Money',
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

    # successfulFulfillments: List of the order’s successful fulfillments.
    # @param first [Types::Int]
    # @return [[Types::Fulfillment!]]
    describe 'successfulFulfillments' do
      let!(:query) {
        %q{
          query {
            order {
              successfulFulfillments(first: Int) {
                fulfillmentLineItems(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false
                ) {
                  edges {
                    node {
                      lineItem {
                        # ...
                      }
                      quantity
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                trackingCompany
                trackingInfo(first: Int) {
                  number
                  url
                }
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              successfulFulfillments: [{
                fulfillmentLineItems: {
                  edges: {
                    node: [{
                      lineItem: {
                        # ...
                      },
                      quantity: 'Int',
                    }],
                  },
                  pageInfo: {
                    hasNextPage: true,
                    hasPreviousPage: false,
                  },
                },
                trackingCompany: 'String',
                trackingInfo: {
                  number: 'String',
                  url: 'URL',
                },
              }],
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

    # totalPrice: The sum of all the prices of all the items in the order, taxes and discounts included (must be positive).
    # @return [Types::Money!]
    describe 'totalPrice' do
      let!(:query) {
        %q{
          query {
            order {
              totalPrice
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              totalPrice: 'Money',
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

    # totalRefunded: The total amount that has been refunded.
    # @return [Types::Money!]
    describe 'totalRefunded' do
      let!(:query) {
        %q{
          query {
            order {
              totalRefunded
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              totalRefunded: 'Money',
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

    # totalShippingPrice: The total cost of shipping.
    # @return [Types::Money!]
    describe 'totalShippingPrice' do
      let!(:query) {
        %q{
          query {
            order {
              totalShippingPrice
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              totalShippingPrice: 'Money',
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

    # totalTax: The total cost of taxes.
    # @return [Types::Money]
    describe 'totalTax' do
      let!(:query) {
        %q{
          query {
            order {
              totalTax
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            order: {
              totalTax: 'Money',
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