# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Checkout' do
    let!(:checkout) { create(:checkout) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # appliedGiftCards
    # @return [[Types::AppliedGiftCard!]!]
    describe 'appliedGiftCards' do
      let!(:query) {
        %q{
          query {
            checkout {
              appliedGiftCards {
                amountUsed
                balance
                id
                lastCharacters
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              appliedGiftCards: [{
                amountUsed: 'Money',
                balance: 'Money',
                id: 'ID',
                lastCharacters: 'String',
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

    # availableShippingRates: The available shipping rates for this Checkout. Should only be used when checkout `requiresShipping` is `true` and the shipping address is valid.
    # @return [Types::AvailableShippingRates]
    describe 'availableShippingRates' do
      let!(:query) {
        %q{
          query {
            checkout {
              availableShippingRates {
                ready
                shippingRates {
                  handle
                  price
                  title
                }
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              availableShippingRates: {
                ready: 'Boolean',
                shippingRates: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
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

    # completedAt: The date and time when the checkout was completed.
    # @return [Types::DateTime]
    describe 'completedAt' do
      let!(:query) {
        %q{
          query {
            checkout {
              completedAt
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              completedAt: 'DateTime',
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

    # createdAt: The date and time when the checkout was created.
    # @return [Types::DateTime!]
    describe 'createdAt' do
      let!(:query) {
        %q{
          query {
            checkout {
              createdAt
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              createdAt: 'DateTime',
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

    # currencyCode: The currency code for the Checkout.
    # @return [Types::CurrencyCode!]
    describe 'currencyCode' do
      let!(:query) {
        %q{
          query {
            checkout {
              currencyCode
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
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

    # customAttributes: A list of extra information that is added to the checkout.
    # @return [[Types::Attribute!]!]
    describe 'customAttributes' do
      let!(:query) {
        %q{
          query {
            checkout {
              customAttributes {
                key
                value
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              customAttributes: [{
                key: 'String',
                value: 'String',
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

    # discountApplications: Discounts that have been applied on the checkout.
    # @param reverse [Types::Boolean] (false)
    # @return [Interfaces::DiscountApplication.connection_type!]
    describe 'discountApplications' do
      let!(:query) {
        %q{
          query {
            checkout {
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
            checkout: {
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

    # email: The email attached to this checkout.
    # @return [Types::String]
    describe 'email' do
      let!(:query) {
        %q{
          query {
            checkout {
              email
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
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
            checkout {
              id
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
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

    # lineItems: A list of line item objects, each one containing information about an item in the checkout.
    # @param reverse [Types::Boolean] (false)
    # @return [Types::CheckoutLineItem.connection_type!]
    describe 'lineItems' do
      let!(:query) {
        %q{
          query {
            checkout {
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
                    id
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
            checkout: {
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
                    id: 'ID',
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

    # note
    # @return [Types::String]
    describe 'note' do
      let!(:query) {
        %q{
          query {
            checkout {
              note
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              note: 'String',
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

    # order: The resulting order from a paid checkout.
    # @return [Types::Order]
    describe 'order' do
      let!(:query) {
        %q{
          query {
            checkout {
              order {
                currencyCode
                customerLocale
                customerUrl
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
                email
                id
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
                        # ...
                      }
                      discountAllocations {
                        # ...
                      }
                      quantity
                      title
                      variant {
                        # ...
                      }
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                name
                orderNumber
                phone
                processedAt
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
                statusUrl
                subtotalPrice
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
                        # ...
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
                totalPrice
                totalRefunded
                totalShippingPrice
                totalTax
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              order: {
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customerLocale: 'String',
                customerUrl: 'URL',
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
                email: 'String',
                id: 'ID',
                lineItems: {
                  edges: {
                    node: [{
                      customAttributes: {
                        # ...
                      },
                      discountAllocations: {
                        # ...
                      },
                      quantity: 'Int',
                      title: 'String',
                      variant: {
                        # ...
                      },
                    }],
                  },
                  pageInfo: {
                    hasNextPage: true,
                    hasPreviousPage: false,
                  },
                },
                name: 'String',
                orderNumber: 'Int',
                phone: 'String',
                processedAt: 'DateTime',
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
                shippingDiscountAllocations: {
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
                },
                statusUrl: 'URL',
                subtotalPrice: 'Money',
                successfulFulfillments: {
                  fulfillmentLineItems: {
                    edges: {
                      node: [{
                        # ...
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
                },
                totalPrice: 'Money',
                totalRefunded: 'Money',
                totalShippingPrice: 'Money',
                totalTax: 'Money',
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

    # orderStatusUrl: The Order Status Page for this Checkout, null when checkout is not completed.
    # @return [Types::URL]
    describe 'orderStatusUrl' do
      let!(:query) {
        %q{
          query {
            checkout {
              orderStatusUrl
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              orderStatusUrl: 'URL',
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

    # paymentDue: The amount left to be paid. This is equal to the cost of the line items, taxes and shipping minus discounts and gift cards.
    # @return [Types::Money!]
    describe 'paymentDue' do
      let!(:query) {
        %q{
          query {
            checkout {
              paymentDue
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              paymentDue: 'Money',
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

    # ready: Whether or not the Checkout is ready and can be completed. Checkouts may have asynchronous operations that can take time to finish. If you want to complete a checkout or ensure all the fields are populated and up to date, polling is required until the value is true.
    # @return [Types::Boolean!]
    describe 'ready' do
      let!(:query) {
        %q{
          query {
            checkout {
              ready
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              ready: 'Boolean',
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

    # requiresShipping: States whether or not the fulfillment requires shipping.
    # @return [Types::Boolean!]
    describe 'requiresShipping' do
      let!(:query) {
        %q{
          query {
            checkout {
              requiresShipping
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              requiresShipping: 'Boolean',
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

    # shippingAddress: The shipping address to where the line items will be shipped.
    # @return [Types::MailingAddress]
    describe 'shippingAddress' do
      let!(:query) {
        %q{
          query {
            checkout {
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
            checkout: {
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
            checkout {
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
            checkout: {
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

    # shippingLine: Once a shipping rate is selected by the customer it is transitioned to a `shipping_line` object.
    # @return [Types::ShippingRate]
    describe 'shippingLine' do
      let!(:query) {
        %q{
          query {
            checkout {
              shippingLine {
                handle
                price
                title
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              shippingLine: {
                handle: 'String',
                price: 'Money',
                title: 'String',
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

    # subtotalPrice: Price of the checkout before shipping and taxes.
    # @return [Types::Money!]
    describe 'subtotalPrice' do
      let!(:query) {
        %q{
          query {
            checkout {
              subtotalPrice
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
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

    # taxExempt: Specifies if the Checkout is tax exempt.
    # @return [Types::Boolean!]
    describe 'taxExempt' do
      let!(:query) {
        %q{
          query {
            checkout {
              taxExempt
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              taxExempt: 'Boolean',
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

    # taxesIncluded: Specifies if taxes are included in the line item and shipping line prices.
    # @return [Types::Boolean!]
    describe 'taxesIncluded' do
      let!(:query) {
        %q{
          query {
            checkout {
              taxesIncluded
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              taxesIncluded: 'Boolean',
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

    # totalPrice: The sum of all the prices of all the items in the checkout, taxes and discounts included.
    # @return [Types::Money!]
    describe 'totalPrice' do
      let!(:query) {
        %q{
          query {
            checkout {
              totalPrice
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
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

    # totalTax: The sum of all the taxes applied to the line items and shipping lines in the checkout.
    # @return [Types::Money!]
    describe 'totalTax' do
      let!(:query) {
        %q{
          query {
            checkout {
              totalTax
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
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

    # updatedAt: The date and time when the checkout was last updated.
    # @return [Types::DateTime!]
    describe 'updatedAt' do
      let!(:query) {
        %q{
          query {
            checkout {
              updatedAt
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              updatedAt: 'DateTime',
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

    # webUrl: The url pointing to the checkout accessible from the web.
    # @return [Types::URL!]
    describe 'webUrl' do
      let!(:query) {
        %q{
          query {
            checkout {
              webUrl
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkout: {
              webUrl: 'URL',
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