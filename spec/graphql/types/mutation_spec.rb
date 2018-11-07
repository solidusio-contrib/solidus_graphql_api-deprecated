# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Mutation' do
    #let!(:mutation) { create(:mutation) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # checkoutAttributesUpdateV2: Updates the attributes of a checkout.
    # @param checkout_id [Types::ID!]
    # @param input [Inputs::CheckoutAttributesUpdateV2!]
    # @return [Payloads::CheckoutAttributesUpdateV2]
    describe 'checkoutAttributesUpdateV2' do
      let!(:query) {
        %q{
          mutation {
            checkoutAttributesUpdateV2(
              checkoutId: "ID",
              input: {
                note: "String",
                customAttributes: {
                  key: "String",
                  value: "String"
                },
                allowPartialAddresses: "Boolean"
              }
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutAttributesUpdateV2: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutCompleteFree
    # @param checkout_id [Types::ID!]
    # @return [Payloads::CheckoutCompleteFree]
    describe 'checkoutCompleteFree' do
      let!(:query) {
        %q{
          mutation {
            checkoutCompleteFree(checkoutId: "ID") {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutCompleteFree: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutCompleteWithCreditCardV2: Completes a checkout using a credit card token from Solidus's Vault.
    # @param checkout_id [Types::ID!]
    # @param payment [Inputs::CreditCardPaymentV2!]
    # @return [Payloads::CheckoutCompleteWithCreditCardV2]
    describe 'checkoutCompleteWithCreditCardV2' do
      let!(:query) {
        %q{
          mutation {
            checkoutCompleteWithCreditCardV2(
              checkoutId: "ID",
              payment: {
                paymentAmount: {
                  amount: "Decimal",
                  currencyCode: "USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW"
                },
                idempotencyKey: "String",
                billingAddress: {
                  address1: "String",
                  address2: "String",
                  city: "String",
                  company: "String",
                  country: "String",
                  firstName: "String",
                  lastName: "String",
                  phone: "String",
                  province: "String",
                  zip: "String"
                },
                vaultId: "String",
                test: "Boolean"
              }
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              payment {
                amount
                billingAddress {
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
                checkout {
                  appliedGiftCards {
                    amountUsed
                    balance
                    id
                    lastCharacters
                  }
                  availableShippingRates {
                    ready
                    shippingRates {
                      # ...
                    }
                  }
                  completedAt
                  createdAt
                  currencyCode
                  customAttributes {
                    key
                    value
                  }
                  customer {
                    acceptsMarketing
                    addresses(
                      first: Int,
                      after: "",
                      last: Int,
                      before: "",
                      reverse: false
                    ) {
                      # ...
                    }
                    createdAt
                    defaultAddress {
                      # ...
                    }
                    displayName
                    email
                    firstName
                    id
                    lastIncompleteCheckout
                    lastName
                    orders(
                      first: Int,
                      after: "",
                      last: Int,
                      before: "",
                      reverse: false,
                      sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                      query: ""
                    ) {
                      # ...
                    }
                    phone
                    updatedAt
                  }
                  discountApplications(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  note
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
                      # ...
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
                      # ...
                    }
                    name
                    orderNumber
                    phone
                    processedAt
                    shippingAddress {
                      # ...
                    }
                    shippingDiscountAllocations {
                      # ...
                    }
                    statusUrl
                    subtotalPrice
                    successfulFulfillments(first: Int) {
                      # ...
                    }
                    totalPrice
                    totalRefunded
                    totalShippingPrice
                    totalTax
                  }
                  orderStatusUrl
                  paymentDue
                  ready
                  requiresShipping
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
                      # ...
                    }
                    discountApplication {
                      # ...
                    }
                  }
                  shippingLine {
                    handle
                    price
                    title
                  }
                  subtotalPrice
                  taxExempt
                  taxesIncluded
                  totalPrice
                  totalTax
                  updatedAt
                  webUrl
                }
                creditCard {
                  brand
                  expiryMonth
                  expiryYear
                  firstDigits
                  firstName
                  lastDigits
                  lastName
                  maskedNumber
                }
                errorMessage
                id
                idempotencyKey
                ready
                test
                transaction {
                  amount
                  kind
                  status
                  test
                }
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutCompleteWithCreditCardV2: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              payment: {
                amount: 'Money',
                billingAddress: {
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
                checkout: {
                  appliedGiftCards: {
                    amountUsed: 'Money',
                    balance: 'Money',
                    id: 'ID',
                    lastCharacters: 'String',
                  },
                  availableShippingRates: {
                    ready: 'Boolean',
                    shippingRates: {
                      # ...
                    },
                  },
                  completedAt: 'DateTime',
                  createdAt: 'DateTime',
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customAttributes: {
                    key: 'String',
                    value: 'String',
                  },
                  customer: {
                    acceptsMarketing: 'Boolean',
                    addresses: {
                      # ...
                    },
                    createdAt: 'DateTime',
                    defaultAddress: {
                      # ...
                    },
                    displayName: 'String',
                    email: 'String',
                    firstName: 'String',
                    id: 'ID',
                    lastIncompleteCheckout: 'Checkout...',
                    lastName: 'String',
                    orders: {
                      # ...
                    },
                    phone: 'String',
                    updatedAt: 'DateTime',
                  },
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  note: 'String',
                  order: {
                    currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                    customerLocale: 'String',
                    customerUrl: 'URL',
                    discountApplications: {
                      # ...
                    },
                    email: 'String',
                    id: 'ID',
                    lineItems: {
                      # ...
                    },
                    name: 'String',
                    orderNumber: 'Int',
                    phone: 'String',
                    processedAt: 'DateTime',
                    shippingAddress: {
                      # ...
                    },
                    shippingDiscountAllocations: {
                      # ...
                    },
                    statusUrl: 'URL',
                    subtotalPrice: 'Money',
                    successfulFulfillments: {
                      # ...
                    },
                    totalPrice: 'Money',
                    totalRefunded: 'Money',
                    totalShippingPrice: 'Money',
                    totalTax: 'Money',
                  },
                  orderStatusUrl: 'URL',
                  paymentDue: 'Money',
                  ready: 'Boolean',
                  requiresShipping: 'Boolean',
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  shippingLine: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                  subtotalPrice: 'Money',
                  taxExempt: 'Boolean',
                  taxesIncluded: 'Boolean',
                  totalPrice: 'Money',
                  totalTax: 'Money',
                  updatedAt: 'DateTime',
                  webUrl: 'URL',
                },
                creditCard: {
                  brand: 'String',
                  expiryMonth: 'Int',
                  expiryYear: 'Int',
                  firstDigits: 'String',
                  firstName: 'String',
                  lastDigits: 'String',
                  lastName: 'String',
                  maskedNumber: 'String',
                },
                errorMessage: 'String',
                id: 'ID',
                idempotencyKey: 'String',
                ready: 'Boolean',
                test: 'Boolean',
                transaction: {
                  amount: 'Money',
                  kind: 'SALE | CAPTURE | AUTHORIZATION | EMV_AUTHORIZATION | CHANGE',
                  status: 'PENDING | SUCCESS | FAILURE | ERROR',
                  test: 'Boolean',
                },
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutCompleteWithTokenizedPaymentV2: Completes a checkout with a tokenized payment.
    # @param checkout_id [Types::ID!]
    # @param payment [Inputs::TokenizedPaymentV2!]
    # @return [Payloads::CheckoutCompleteWithTokenizedPaymentV2]
    describe 'checkoutCompleteWithTokenizedPaymentV2' do
      let!(:query) {
        %q{
          mutation {
            checkoutCompleteWithTokenizedPaymentV2(
              checkoutId: "ID",
              payment: {
                paymentAmount: {
                  amount: "Decimal",
                  currencyCode: "USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW"
                },
                idempotencyKey: "String",
                billingAddress: {
                  address1: "String",
                  address2: "String",
                  city: "String",
                  company: "String",
                  country: "String",
                  firstName: "String",
                  lastName: "String",
                  phone: "String",
                  province: "String",
                  zip: "String"
                },
                type: "String",
                paymentData: "String",
                test: "Boolean",
                identifier: "String"
              }
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              payment {
                amount
                billingAddress {
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
                checkout {
                  appliedGiftCards {
                    amountUsed
                    balance
                    id
                    lastCharacters
                  }
                  availableShippingRates {
                    ready
                    shippingRates {
                      # ...
                    }
                  }
                  completedAt
                  createdAt
                  currencyCode
                  customAttributes {
                    key
                    value
                  }
                  customer {
                    acceptsMarketing
                    addresses(
                      first: Int,
                      after: "",
                      last: Int,
                      before: "",
                      reverse: false
                    ) {
                      # ...
                    }
                    createdAt
                    defaultAddress {
                      # ...
                    }
                    displayName
                    email
                    firstName
                    id
                    lastIncompleteCheckout
                    lastName
                    orders(
                      first: Int,
                      after: "",
                      last: Int,
                      before: "",
                      reverse: false,
                      sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                      query: ""
                    ) {
                      # ...
                    }
                    phone
                    updatedAt
                  }
                  discountApplications(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  note
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
                      # ...
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
                      # ...
                    }
                    name
                    orderNumber
                    phone
                    processedAt
                    shippingAddress {
                      # ...
                    }
                    shippingDiscountAllocations {
                      # ...
                    }
                    statusUrl
                    subtotalPrice
                    successfulFulfillments(first: Int) {
                      # ...
                    }
                    totalPrice
                    totalRefunded
                    totalShippingPrice
                    totalTax
                  }
                  orderStatusUrl
                  paymentDue
                  ready
                  requiresShipping
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
                      # ...
                    }
                    discountApplication {
                      # ...
                    }
                  }
                  shippingLine {
                    handle
                    price
                    title
                  }
                  subtotalPrice
                  taxExempt
                  taxesIncluded
                  totalPrice
                  totalTax
                  updatedAt
                  webUrl
                }
                creditCard {
                  brand
                  expiryMonth
                  expiryYear
                  firstDigits
                  firstName
                  lastDigits
                  lastName
                  maskedNumber
                }
                errorMessage
                id
                idempotencyKey
                ready
                test
                transaction {
                  amount
                  kind
                  status
                  test
                }
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutCompleteWithTokenizedPaymentV2: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              payment: {
                amount: 'Money',
                billingAddress: {
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
                checkout: {
                  appliedGiftCards: {
                    amountUsed: 'Money',
                    balance: 'Money',
                    id: 'ID',
                    lastCharacters: 'String',
                  },
                  availableShippingRates: {
                    ready: 'Boolean',
                    shippingRates: {
                      # ...
                    },
                  },
                  completedAt: 'DateTime',
                  createdAt: 'DateTime',
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customAttributes: {
                    key: 'String',
                    value: 'String',
                  },
                  customer: {
                    acceptsMarketing: 'Boolean',
                    addresses: {
                      # ...
                    },
                    createdAt: 'DateTime',
                    defaultAddress: {
                      # ...
                    },
                    displayName: 'String',
                    email: 'String',
                    firstName: 'String',
                    id: 'ID',
                    lastIncompleteCheckout: 'Checkout...',
                    lastName: 'String',
                    orders: {
                      # ...
                    },
                    phone: 'String',
                    updatedAt: 'DateTime',
                  },
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  note: 'String',
                  order: {
                    currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                    customerLocale: 'String',
                    customerUrl: 'URL',
                    discountApplications: {
                      # ...
                    },
                    email: 'String',
                    id: 'ID',
                    lineItems: {
                      # ...
                    },
                    name: 'String',
                    orderNumber: 'Int',
                    phone: 'String',
                    processedAt: 'DateTime',
                    shippingAddress: {
                      # ...
                    },
                    shippingDiscountAllocations: {
                      # ...
                    },
                    statusUrl: 'URL',
                    subtotalPrice: 'Money',
                    successfulFulfillments: {
                      # ...
                    },
                    totalPrice: 'Money',
                    totalRefunded: 'Money',
                    totalShippingPrice: 'Money',
                    totalTax: 'Money',
                  },
                  orderStatusUrl: 'URL',
                  paymentDue: 'Money',
                  ready: 'Boolean',
                  requiresShipping: 'Boolean',
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  shippingLine: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                  subtotalPrice: 'Money',
                  taxExempt: 'Boolean',
                  taxesIncluded: 'Boolean',
                  totalPrice: 'Money',
                  totalTax: 'Money',
                  updatedAt: 'DateTime',
                  webUrl: 'URL',
                },
                creditCard: {
                  brand: 'String',
                  expiryMonth: 'Int',
                  expiryYear: 'Int',
                  firstDigits: 'String',
                  firstName: 'String',
                  lastDigits: 'String',
                  lastName: 'String',
                  maskedNumber: 'String',
                },
                errorMessage: 'String',
                id: 'ID',
                idempotencyKey: 'String',
                ready: 'Boolean',
                test: 'Boolean',
                transaction: {
                  amount: 'Money',
                  kind: 'SALE | CAPTURE | AUTHORIZATION | EMV_AUTHORIZATION | CHANGE',
                  status: 'PENDING | SUCCESS | FAILURE | ERROR',
                  test: 'Boolean',
                },
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutCreate: Creates a new checkout.
    # @param input [Inputs::CheckoutCreate!]
    # @return [Payloads::CheckoutCreate]
    describe 'checkoutCreate' do
      let!(:query) {
        %q{
          mutation {
            checkoutCreate(
              input: {
                email: "String",
                lineItems: {
                  customAttributes: {
                    key: "String",
                    value: "String"
                  },
                  quantity: "Int",
                  variantId: "ID"
                },
                shippingAddress: {
                  address1: "String",
                  address2: "String",
                  city: "String",
                  company: "String",
                  country: "String",
                  firstName: "String",
                  lastName: "String",
                  phone: "String",
                  province: "String",
                  zip: "String"
                },
                note: "String",
                customAttributes: {
                  key: "String",
                  value: "String"
                },
                allowPartialAddresses: "Boolean"
              }
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              checkoutUserErrors {
                code
                field
                message
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutCreate: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              checkoutUserErrors: {
                code: 'BLANK | INVALID | TOO_LONG | PRESENT | LESS_THAN | ALREADY_COMPLETED | LOCKED | NOT_SUPPORTED | INVALID_FOR_COUNTRY_AND_PROVINCE | INVALID_STATE_IN_COUNTRY | INVALID_PROVINCE_IN_COUNTRY | INVALID_REGION_IN_COUNTRY | SHIPPING_RATE_EXPIRED | GIFT_CARD_UNUSABLE | CART_DOES_NOT_MEET_DISCOUNT_REQUIREMENTS_NOTICE | DISCOUNT_EXPIRED | DISCOUNT_DISABLED | DISCOUNT_LIMIT_REACHED | DISCOUNT_NOT_FOUND | CUSTOMER_ALREADY_USED_ONCE_PER_CUSTOMER_DISCOUNT_NOTICE | EMPTY | NOT_ENOUGH_IN_STOCK',
                field: 'String',
                message: 'String',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutCustomerAssociateV2: Associates a customer to the checkout.
    # @param checkout_id [Types::ID!]
    # @param customer_access_token [Types::String!]
    # @return [Payloads::CheckoutCustomerAssociateV2]
    describe 'checkoutCustomerAssociateV2' do
      let!(:query) {
        %q{
          mutation {
            checkoutCustomerAssociateV2(
              checkoutId: "ID",
              customerAccessToken: ""
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              customer {
                acceptsMarketing
                addresses(
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
                createdAt
                defaultAddress {
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
                displayName
                email
                firstName
                id
                lastIncompleteCheckout {
                  appliedGiftCards {
                    amountUsed
                    balance
                    id
                    lastCharacters
                  }
                  availableShippingRates {
                    ready
                    shippingRates {
                      # ...
                    }
                  }
                  completedAt
                  createdAt
                  currencyCode
                  customAttributes {
                    key
                    value
                  }
                  customer
                  discountApplications(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  note
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
                      # ...
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
                      # ...
                    }
                    name
                    orderNumber
                    phone
                    processedAt
                    shippingAddress {
                      # ...
                    }
                    shippingDiscountAllocations {
                      # ...
                    }
                    statusUrl
                    subtotalPrice
                    successfulFulfillments(first: Int) {
                      # ...
                    }
                    totalPrice
                    totalRefunded
                    totalShippingPrice
                    totalTax
                  }
                  orderStatusUrl
                  paymentDue
                  ready
                  requiresShipping
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
                      # ...
                    }
                    discountApplication {
                      # ...
                    }
                  }
                  shippingLine {
                    handle
                    price
                    title
                  }
                  subtotalPrice
                  taxExempt
                  taxesIncluded
                  totalPrice
                  totalTax
                  updatedAt
                  webUrl
                }
                lastName
                orders(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false,
                  sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                  query: ""
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
                phone
                updatedAt
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutCustomerAssociateV2: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              customer: {
                acceptsMarketing: 'Boolean',
                addresses: {
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
                createdAt: 'DateTime',
                defaultAddress: {
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
                displayName: 'String',
                email: 'String',
                firstName: 'String',
                id: 'ID',
                lastIncompleteCheckout: {
                  appliedGiftCards: {
                    amountUsed: 'Money',
                    balance: 'Money',
                    id: 'ID',
                    lastCharacters: 'String',
                  },
                  availableShippingRates: {
                    ready: 'Boolean',
                    shippingRates: {
                      # ...
                    },
                  },
                  completedAt: 'DateTime',
                  createdAt: 'DateTime',
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customAttributes: {
                    key: 'String',
                    value: 'String',
                  },
                  customer: 'Customer...',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  note: 'String',
                  order: {
                    currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                    customerLocale: 'String',
                    customerUrl: 'URL',
                    discountApplications: {
                      # ...
                    },
                    email: 'String',
                    id: 'ID',
                    lineItems: {
                      # ...
                    },
                    name: 'String',
                    orderNumber: 'Int',
                    phone: 'String',
                    processedAt: 'DateTime',
                    shippingAddress: {
                      # ...
                    },
                    shippingDiscountAllocations: {
                      # ...
                    },
                    statusUrl: 'URL',
                    subtotalPrice: 'Money',
                    successfulFulfillments: {
                      # ...
                    },
                    totalPrice: 'Money',
                    totalRefunded: 'Money',
                    totalShippingPrice: 'Money',
                    totalTax: 'Money',
                  },
                  orderStatusUrl: 'URL',
                  paymentDue: 'Money',
                  ready: 'Boolean',
                  requiresShipping: 'Boolean',
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  shippingLine: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                  subtotalPrice: 'Money',
                  taxExempt: 'Boolean',
                  taxesIncluded: 'Boolean',
                  totalPrice: 'Money',
                  totalTax: 'Money',
                  updatedAt: 'DateTime',
                  webUrl: 'URL',
                },
                lastName: 'String',
                orders: {
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
                phone: 'String',
                updatedAt: 'DateTime',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutCustomerDisassociate: Disassociates the current checkout customer from the checkout.
    # @param checkout_id [Types::ID!]
    # @return [Payloads::CheckoutCustomerDisassociate]
    describe 'checkoutCustomerDisassociate' do
      let!(:query) {
        %q{
          mutation {
            checkoutCustomerDisassociate(checkoutId: "ID") {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutCustomerDisassociate: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutDiscountCodeApply: Applies a discount to an existing checkout using a discount code.
    # @param discount_code [Types::String!]
    # @param checkout_id [Types::ID!]
    # @return [Payloads::CheckoutDiscountCodeApply]
    describe 'checkoutDiscountCodeApply' do
      let!(:query) {
        %q{
          mutation {
            checkoutDiscountCodeApply(
              discountCode: "",
              checkoutId: "ID"
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutDiscountCodeApply: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutDiscountCodeRemove: Removes the applied discount from an existing checkout.
    # @param checkout_id [Types::ID!]
    # @return [Payloads::CheckoutDiscountCodeRemove]
    describe 'checkoutDiscountCodeRemove' do
      let!(:query) {
        %q{
          mutation {
            checkoutDiscountCodeRemove(checkoutId: "ID") {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutDiscountCodeRemove: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutEmailUpdate: Updates the email on an existing checkout.
    # @param checkout_id [Types::ID!]
    # @param email [Types::String!]
    # @return [Payloads::CheckoutEmailUpdate]
    describe 'checkoutEmailUpdate' do
      let!(:query) {
        %q{
          mutation {
            checkoutEmailUpdate(
              checkoutId: "ID",
              email: ""
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutEmailUpdate: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutGiftCardRemove: Removes an applied gift card from the checkout.
    # @param applied_gift_card_id [Types::ID!]
    # @param checkout_id [Types::ID!]
    # @return [Payloads::CheckoutGiftCardRemove]
    describe 'checkoutGiftCardRemove' do
      let!(:query) {
        %q{
          mutation {
            checkoutGiftCardRemove(
              appliedGiftCardId: "ID",
              checkoutId: "ID"
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutGiftCardRemove: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutGiftCardsAppend: Appends gift cards to an existing checkout.
    # @param gift_card_codes [[Types::String!]!]
    # @param checkout_id [Types::ID!]
    # @return [Payloads::CheckoutGiftCardsAppend]
    describe 'checkoutGiftCardsAppend' do
      let!(:query) {
        %q{
          mutation {
            checkoutGiftCardsAppend(
              giftCardCodes: [""],
              checkoutId: "ID"
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutGiftCardsAppend: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutLineItemsAdd: Adds a list of line items to a checkout.
    # @param line_items [[Inputs::CheckoutLineItem!]!]
    # @param checkout_id [Types::ID!]
    # @return [Payloads::CheckoutLineItemsAdd]
    describe 'checkoutLineItemsAdd' do
      let!(:query) {
        %q{
          mutation {
            checkoutLineItemsAdd(
              lineItems: [{
                customAttributes: {
                  key: "String",
                  value: "String"
                },
                quantity: "Int",
                variantId: "ID"
              }],
              checkoutId: "ID"
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutLineItemsAdd: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutLineItemsRemove: Removes line items from an existing checkout
    # @param checkout_id [Types::ID!]
    # @param line_item_ids [[Types::ID!]!]
    # @return [Payloads::CheckoutLineItemsRemove]
    describe 'checkoutLineItemsRemove' do
      let!(:query) {
        %q{
          mutation {
            checkoutLineItemsRemove(
              checkoutId: "ID",
              lineItemIds: ["ID"]
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutLineItemsRemove: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutLineItemsUpdate: Updates line items on a checkout.
    # @param checkout_id [Types::ID!]
    # @param line_items [[Inputs::CheckoutLineItemUpdate!]!]
    # @return [Payloads::CheckoutLineItemsUpdate]
    describe 'checkoutLineItemsUpdate' do
      let!(:query) {
        %q{
          mutation {
            checkoutLineItemsUpdate(
              checkoutId: "ID",
              lineItems: [{
                id: "ID",
                variantId: "ID",
                quantity: "Int",
                customAttributes: {
                  key: "String",
                  value: "String"
                }
              }]
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutLineItemsUpdate: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutShippingAddressUpdate: Updates the shipping address of an existing checkout.
    # @param shipping_address [Inputs::MailingAddress!]
    # @param checkout_id [Types::ID!]
    # @return [Payloads::CheckoutShippingAddressUpdate]
    describe 'checkoutShippingAddressUpdate' do
      let!(:query) {
        %q{
          mutation {
            checkoutShippingAddressUpdate(
              shippingAddress: {
                address1: "String",
                address2: "String",
                city: "String",
                company: "String",
                country: "String",
                firstName: "String",
                lastName: "String",
                phone: "String",
                province: "String",
                zip: "String"
              },
              checkoutId: "ID"
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutShippingAddressUpdate: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # checkoutShippingLineUpdate: Updates the shipping lines on an existing checkout.
    # @param checkout_id [Types::ID!]
    # @param shipping_rate_handle [Types::String!]
    # @return [Payloads::CheckoutShippingLineUpdate]
    describe 'checkoutShippingLineUpdate' do
      let!(:query) {
        %q{
          mutation {
            checkoutShippingLineUpdate(
              checkoutId: "ID",
              shippingRateHandle: ""
            ) {
              checkout {
                appliedGiftCards {
                  amountUsed
                  balance
                  id
                  lastCharacters
                }
                availableShippingRates {
                  ready
                  shippingRates {
                    handle
                    price
                    title
                  }
                }
                completedAt
                createdAt
                currencyCode
                customAttributes {
                  key
                  value
                }
                customer {
                  acceptsMarketing
                  addresses(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  createdAt
                  defaultAddress {
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
                  displayName
                  email
                  firstName
                  id
                  lastIncompleteCheckout
                  lastName
                  orders(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                    query: ""
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  phone
                  updatedAt
                }
                discountApplications(
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
                      # ...
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                note
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    discountApplication {
                      # ...
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
                      # ...
                    }
                    trackingCompany
                    trackingInfo(first: Int) {
                      # ...
                    }
                  }
                  totalPrice
                  totalRefunded
                  totalShippingPrice
                  totalTax
                }
                orderStatusUrl
                paymentDue
                ready
                requiresShipping
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
                shippingLine {
                  handle
                  price
                  title
                }
                subtotalPrice
                taxExempt
                taxesIncluded
                totalPrice
                totalTax
                updatedAt
                webUrl
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            checkoutShippingLineUpdate: {
              checkout: {
                appliedGiftCards: {
                  amountUsed: 'Money',
                  balance: 'Money',
                  id: 'ID',
                  lastCharacters: 'String',
                },
                availableShippingRates: {
                  ready: 'Boolean',
                  shippingRates: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                },
                completedAt: 'DateTime',
                createdAt: 'DateTime',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                customer: {
                  acceptsMarketing: 'Boolean',
                  addresses: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  createdAt: 'DateTime',
                  defaultAddress: {
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
                  displayName: 'String',
                  email: 'String',
                  firstName: 'String',
                  id: 'ID',
                  lastIncompleteCheckout: 'Checkout...',
                  lastName: 'String',
                  orders: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  phone: 'String',
                  updatedAt: 'DateTime',
                },
                discountApplications: {
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
                email: 'String',
                id: 'ID',
                lineItems: {
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
                note: 'String',
                order: {
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customerLocale: 'String',
                  customerUrl: 'URL',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  statusUrl: 'URL',
                  subtotalPrice: 'Money',
                  successfulFulfillments: {
                    fulfillmentLineItems: {
                      # ...
                    },
                    trackingCompany: 'String',
                    trackingInfo: {
                      # ...
                    },
                  },
                  totalPrice: 'Money',
                  totalRefunded: 'Money',
                  totalShippingPrice: 'Money',
                  totalTax: 'Money',
                },
                orderStatusUrl: 'URL',
                paymentDue: 'Money',
                ready: 'Boolean',
                requiresShipping: 'Boolean',
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
                shippingLine: {
                  handle: 'String',
                  price: 'Money',
                  title: 'String',
                },
                subtotalPrice: 'Money',
                taxExempt: 'Boolean',
                taxesIncluded: 'Boolean',
                totalPrice: 'Money',
                totalTax: 'Money',
                updatedAt: 'DateTime',
                webUrl: 'URL',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # customerAccessTokenCreate: Creates a customer access token. The customer access token is required to modify the customer object in any way.
    # @param input [Inputs::CustomerAccessTokenCreate!]
    # @return [Payloads::CustomerAccessTokenCreate]
    describe 'customerAccessTokenCreate' do
      let!(:query) {
        %q{
          mutation {
            customerAccessTokenCreate(
              input: {
                email: "String",
                password: "String"
              }
            ) {
              customerAccessToken {
                accessToken
                expiresAt
              }
              customerUserErrors {
                code
                field
                message
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerAccessTokenCreate: {
              customerAccessToken: {
                accessToken: 'String',
                expiresAt: 'DateTime',
              },
              customerUserErrors: {
                code: 'BLANK | INVALID | TAKEN | TOO_LONG | TOO_SHORT | UNIDENTIFIED_CUSTOMER | CUSTOMER_DISABLED | PASSWORD_STARTS_OR_ENDS_WITH_WHITESPACE | CONTAINS_HTML_TAGS | CONTAINS_URL',
                field: 'String',
                message: 'String',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # customerAccessTokenDelete: Permanently destroys a customer access token.
    # @param customer_access_token [Types::String!]
    # @return [Payloads::CustomerAccessTokenDelete]
    describe 'customerAccessTokenDelete' do
      let!(:query) {
        %q{
          mutation {
            customerAccessTokenDelete(customerAccessToken: "") {
              deletedAccessToken
              deletedCustomerAccessTokenId
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerAccessTokenDelete: {
              deletedAccessToken: 'String',
              deletedCustomerAccessTokenId: 'String',
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # customerAccessTokenRenew: Renews a customer access token. Access token renewal must happen *before* a token expires. If a token has already expired, a new one should be created instead via `customerAccessTokenCreate`.
    # @param customer_access_token [Types::String!]
    # @return [Payloads::CustomerAccessTokenRenew]
    describe 'customerAccessTokenRenew' do
      let!(:query) {
        %q{
          mutation {
            customerAccessTokenRenew(customerAccessToken: "") {
              customerAccessToken {
                accessToken
                expiresAt
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerAccessTokenRenew: {
              customerAccessToken: {
                accessToken: 'String',
                expiresAt: 'DateTime',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # customerActivate: Activates a customer.
    # @param id [Types::ID!]
    # @param input [Inputs::CustomerActivate!]
    # @return [Payloads::CustomerActivate]
    describe 'customerActivate' do
      let!(:query) {
        %q{
          mutation {
            customerActivate(
              id: "ID",
              input: {
                activationToken: "String",
                password: "String"
              }
            ) {
              customer {
                acceptsMarketing
                addresses(
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
                createdAt
                defaultAddress {
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
                displayName
                email
                firstName
                id
                lastIncompleteCheckout {
                  appliedGiftCards {
                    amountUsed
                    balance
                    id
                    lastCharacters
                  }
                  availableShippingRates {
                    ready
                    shippingRates {
                      # ...
                    }
                  }
                  completedAt
                  createdAt
                  currencyCode
                  customAttributes {
                    key
                    value
                  }
                  customer
                  discountApplications(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  note
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
                      # ...
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
                      # ...
                    }
                    name
                    orderNumber
                    phone
                    processedAt
                    shippingAddress {
                      # ...
                    }
                    shippingDiscountAllocations {
                      # ...
                    }
                    statusUrl
                    subtotalPrice
                    successfulFulfillments(first: Int) {
                      # ...
                    }
                    totalPrice
                    totalRefunded
                    totalShippingPrice
                    totalTax
                  }
                  orderStatusUrl
                  paymentDue
                  ready
                  requiresShipping
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
                      # ...
                    }
                    discountApplication {
                      # ...
                    }
                  }
                  shippingLine {
                    handle
                    price
                    title
                  }
                  subtotalPrice
                  taxExempt
                  taxesIncluded
                  totalPrice
                  totalTax
                  updatedAt
                  webUrl
                }
                lastName
                orders(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false,
                  sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                  query: ""
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
                phone
                updatedAt
              }
              customerAccessToken {
                accessToken
                expiresAt
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerActivate: {
              customer: {
                acceptsMarketing: 'Boolean',
                addresses: {
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
                createdAt: 'DateTime',
                defaultAddress: {
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
                displayName: 'String',
                email: 'String',
                firstName: 'String',
                id: 'ID',
                lastIncompleteCheckout: {
                  appliedGiftCards: {
                    amountUsed: 'Money',
                    balance: 'Money',
                    id: 'ID',
                    lastCharacters: 'String',
                  },
                  availableShippingRates: {
                    ready: 'Boolean',
                    shippingRates: {
                      # ...
                    },
                  },
                  completedAt: 'DateTime',
                  createdAt: 'DateTime',
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customAttributes: {
                    key: 'String',
                    value: 'String',
                  },
                  customer: 'Customer...',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  note: 'String',
                  order: {
                    currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                    customerLocale: 'String',
                    customerUrl: 'URL',
                    discountApplications: {
                      # ...
                    },
                    email: 'String',
                    id: 'ID',
                    lineItems: {
                      # ...
                    },
                    name: 'String',
                    orderNumber: 'Int',
                    phone: 'String',
                    processedAt: 'DateTime',
                    shippingAddress: {
                      # ...
                    },
                    shippingDiscountAllocations: {
                      # ...
                    },
                    statusUrl: 'URL',
                    subtotalPrice: 'Money',
                    successfulFulfillments: {
                      # ...
                    },
                    totalPrice: 'Money',
                    totalRefunded: 'Money',
                    totalShippingPrice: 'Money',
                    totalTax: 'Money',
                  },
                  orderStatusUrl: 'URL',
                  paymentDue: 'Money',
                  ready: 'Boolean',
                  requiresShipping: 'Boolean',
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  shippingLine: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                  subtotalPrice: 'Money',
                  taxExempt: 'Boolean',
                  taxesIncluded: 'Boolean',
                  totalPrice: 'Money',
                  totalTax: 'Money',
                  updatedAt: 'DateTime',
                  webUrl: 'URL',
                },
                lastName: 'String',
                orders: {
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
                phone: 'String',
                updatedAt: 'DateTime',
              },
              customerAccessToken: {
                accessToken: 'String',
                expiresAt: 'DateTime',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # customerAddressCreate: Creates a new address for a customer.
    # @param customer_access_token [Types::String!]
    # @param address [Inputs::MailingAddress!]
    # @return [Payloads::CustomerAddressCreate]
    describe 'customerAddressCreate' do
      let!(:query) {
        %q{
          mutation {
            customerAddressCreate(
              customerAccessToken: "",
              address: {
                address1: "String",
                address2: "String",
                city: "String",
                company: "String",
                country: "String",
                firstName: "String",
                lastName: "String",
                phone: "String",
                province: "String",
                zip: "String"
              }
            ) {
              customerAddress {
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
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerAddressCreate: {
              customerAddress: {
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
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # customerAddressDelete: Permanently deletes the address of an existing customer.
    # @param id [Types::ID!]
    # @param customer_access_token [Types::String!]
    # @return [Payloads::CustomerAddressDelete]
    describe 'customerAddressDelete' do
      let!(:query) {
        %q{
          mutation {
            customerAddressDelete(
              id: "ID",
              customerAccessToken: ""
            ) {
              deletedCustomerAddressId
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerAddressDelete: {
              deletedCustomerAddressId: 'String',
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # customerAddressUpdate: Updates the address of an existing customer.
    # @param customer_access_token [Types::String!]
    # @param id [Types::ID!]
    # @param address [Inputs::MailingAddress!]
    # @return [Payloads::CustomerAddressUpdate]
    describe 'customerAddressUpdate' do
      let!(:query) {
        %q{
          mutation {
            customerAddressUpdate(
              customerAccessToken: "",
              id: "ID",
              address: {
                address1: "String",
                address2: "String",
                city: "String",
                company: "String",
                country: "String",
                firstName: "String",
                lastName: "String",
                phone: "String",
                province: "String",
                zip: "String"
              }
            ) {
              customerAddress {
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
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerAddressUpdate: {
              customerAddress: {
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
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # customerCreate: Creates a new customer.
    # @param input [Inputs::CustomerCreate!]
    # @return [Payloads::CustomerCreate]
    describe 'customerCreate' do
      let!(:query) {
        %q{
          mutation {
            customerCreate(
              input: {
                firstName: "String",
                lastName: "String",
                email: "String",
                phone: "String",
                password: "String",
                acceptsMarketing: "Boolean"
              }
            ) {
              customer {
                acceptsMarketing
                addresses(
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
                createdAt
                defaultAddress {
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
                displayName
                email
                firstName
                id
                lastIncompleteCheckout {
                  appliedGiftCards {
                    amountUsed
                    balance
                    id
                    lastCharacters
                  }
                  availableShippingRates {
                    ready
                    shippingRates {
                      # ...
                    }
                  }
                  completedAt
                  createdAt
                  currencyCode
                  customAttributes {
                    key
                    value
                  }
                  customer
                  discountApplications(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  note
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
                      # ...
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
                      # ...
                    }
                    name
                    orderNumber
                    phone
                    processedAt
                    shippingAddress {
                      # ...
                    }
                    shippingDiscountAllocations {
                      # ...
                    }
                    statusUrl
                    subtotalPrice
                    successfulFulfillments(first: Int) {
                      # ...
                    }
                    totalPrice
                    totalRefunded
                    totalShippingPrice
                    totalTax
                  }
                  orderStatusUrl
                  paymentDue
                  ready
                  requiresShipping
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
                      # ...
                    }
                    discountApplication {
                      # ...
                    }
                  }
                  shippingLine {
                    handle
                    price
                    title
                  }
                  subtotalPrice
                  taxExempt
                  taxesIncluded
                  totalPrice
                  totalTax
                  updatedAt
                  webUrl
                }
                lastName
                orders(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false,
                  sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                  query: ""
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
                phone
                updatedAt
              }
              customerUserErrors {
                code
                field
                message
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerCreate: {
              customer: {
                acceptsMarketing: 'Boolean',
                addresses: {
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
                createdAt: 'DateTime',
                defaultAddress: {
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
                displayName: 'String',
                email: 'String',
                firstName: 'String',
                id: 'ID',
                lastIncompleteCheckout: {
                  appliedGiftCards: {
                    amountUsed: 'Money',
                    balance: 'Money',
                    id: 'ID',
                    lastCharacters: 'String',
                  },
                  availableShippingRates: {
                    ready: 'Boolean',
                    shippingRates: {
                      # ...
                    },
                  },
                  completedAt: 'DateTime',
                  createdAt: 'DateTime',
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customAttributes: {
                    key: 'String',
                    value: 'String',
                  },
                  customer: 'Customer...',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  note: 'String',
                  order: {
                    currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                    customerLocale: 'String',
                    customerUrl: 'URL',
                    discountApplications: {
                      # ...
                    },
                    email: 'String',
                    id: 'ID',
                    lineItems: {
                      # ...
                    },
                    name: 'String',
                    orderNumber: 'Int',
                    phone: 'String',
                    processedAt: 'DateTime',
                    shippingAddress: {
                      # ...
                    },
                    shippingDiscountAllocations: {
                      # ...
                    },
                    statusUrl: 'URL',
                    subtotalPrice: 'Money',
                    successfulFulfillments: {
                      # ...
                    },
                    totalPrice: 'Money',
                    totalRefunded: 'Money',
                    totalShippingPrice: 'Money',
                    totalTax: 'Money',
                  },
                  orderStatusUrl: 'URL',
                  paymentDue: 'Money',
                  ready: 'Boolean',
                  requiresShipping: 'Boolean',
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  shippingLine: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                  subtotalPrice: 'Money',
                  taxExempt: 'Boolean',
                  taxesIncluded: 'Boolean',
                  totalPrice: 'Money',
                  totalTax: 'Money',
                  updatedAt: 'DateTime',
                  webUrl: 'URL',
                },
                lastName: 'String',
                orders: {
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
                phone: 'String',
                updatedAt: 'DateTime',
              },
              customerUserErrors: {
                code: 'BLANK | INVALID | TAKEN | TOO_LONG | TOO_SHORT | UNIDENTIFIED_CUSTOMER | CUSTOMER_DISABLED | PASSWORD_STARTS_OR_ENDS_WITH_WHITESPACE | CONTAINS_HTML_TAGS | CONTAINS_URL',
                field: 'String',
                message: 'String',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # customerDefaultAddressUpdate: Updates the default address of an existing customer.
    # @param customer_access_token [Types::String!]
    # @param address_id [Types::ID!]
    # @return [Payloads::CustomerDefaultAddressUpdate]
    describe 'customerDefaultAddressUpdate' do
      let!(:query) {
        %q{
          mutation {
            customerDefaultAddressUpdate(
              customerAccessToken: "",
              addressId: "ID"
            ) {
              customer {
                acceptsMarketing
                addresses(
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
                createdAt
                defaultAddress {
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
                displayName
                email
                firstName
                id
                lastIncompleteCheckout {
                  appliedGiftCards {
                    amountUsed
                    balance
                    id
                    lastCharacters
                  }
                  availableShippingRates {
                    ready
                    shippingRates {
                      # ...
                    }
                  }
                  completedAt
                  createdAt
                  currencyCode
                  customAttributes {
                    key
                    value
                  }
                  customer
                  discountApplications(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  note
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
                      # ...
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
                      # ...
                    }
                    name
                    orderNumber
                    phone
                    processedAt
                    shippingAddress {
                      # ...
                    }
                    shippingDiscountAllocations {
                      # ...
                    }
                    statusUrl
                    subtotalPrice
                    successfulFulfillments(first: Int) {
                      # ...
                    }
                    totalPrice
                    totalRefunded
                    totalShippingPrice
                    totalTax
                  }
                  orderStatusUrl
                  paymentDue
                  ready
                  requiresShipping
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
                      # ...
                    }
                    discountApplication {
                      # ...
                    }
                  }
                  shippingLine {
                    handle
                    price
                    title
                  }
                  subtotalPrice
                  taxExempt
                  taxesIncluded
                  totalPrice
                  totalTax
                  updatedAt
                  webUrl
                }
                lastName
                orders(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false,
                  sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                  query: ""
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
                phone
                updatedAt
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerDefaultAddressUpdate: {
              customer: {
                acceptsMarketing: 'Boolean',
                addresses: {
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
                createdAt: 'DateTime',
                defaultAddress: {
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
                displayName: 'String',
                email: 'String',
                firstName: 'String',
                id: 'ID',
                lastIncompleteCheckout: {
                  appliedGiftCards: {
                    amountUsed: 'Money',
                    balance: 'Money',
                    id: 'ID',
                    lastCharacters: 'String',
                  },
                  availableShippingRates: {
                    ready: 'Boolean',
                    shippingRates: {
                      # ...
                    },
                  },
                  completedAt: 'DateTime',
                  createdAt: 'DateTime',
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customAttributes: {
                    key: 'String',
                    value: 'String',
                  },
                  customer: 'Customer...',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  note: 'String',
                  order: {
                    currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                    customerLocale: 'String',
                    customerUrl: 'URL',
                    discountApplications: {
                      # ...
                    },
                    email: 'String',
                    id: 'ID',
                    lineItems: {
                      # ...
                    },
                    name: 'String',
                    orderNumber: 'Int',
                    phone: 'String',
                    processedAt: 'DateTime',
                    shippingAddress: {
                      # ...
                    },
                    shippingDiscountAllocations: {
                      # ...
                    },
                    statusUrl: 'URL',
                    subtotalPrice: 'Money',
                    successfulFulfillments: {
                      # ...
                    },
                    totalPrice: 'Money',
                    totalRefunded: 'Money',
                    totalShippingPrice: 'Money',
                    totalTax: 'Money',
                  },
                  orderStatusUrl: 'URL',
                  paymentDue: 'Money',
                  ready: 'Boolean',
                  requiresShipping: 'Boolean',
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  shippingLine: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                  subtotalPrice: 'Money',
                  taxExempt: 'Boolean',
                  taxesIncluded: 'Boolean',
                  totalPrice: 'Money',
                  totalTax: 'Money',
                  updatedAt: 'DateTime',
                  webUrl: 'URL',
                },
                lastName: 'String',
                orders: {
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
                phone: 'String',
                updatedAt: 'DateTime',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # customerRecover: Sends a reset password email to the customer, as the first step in the reset password process.
    # @param email [Types::String!]
    # @return [Payloads::CustomerRecover]
    describe 'customerRecover' do
      let!(:query) {
        %q{
          mutation {
            customerRecover(email: "") {
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerRecover: {
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # customerReset: Resets a customer’s password with a token received from `CustomerRecover`.
    # @param id [Types::ID!]
    # @param input [Inputs::CustomerReset!]
    # @return [Payloads::CustomerReset]
    describe 'customerReset' do
      let!(:query) {
        %q{
          mutation {
            customerReset(
              id: "ID",
              input: {
                resetToken: "String",
                password: "String"
              }
            ) {
              customer {
                acceptsMarketing
                addresses(
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
                createdAt
                defaultAddress {
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
                displayName
                email
                firstName
                id
                lastIncompleteCheckout {
                  appliedGiftCards {
                    amountUsed
                    balance
                    id
                    lastCharacters
                  }
                  availableShippingRates {
                    ready
                    shippingRates {
                      # ...
                    }
                  }
                  completedAt
                  createdAt
                  currencyCode
                  customAttributes {
                    key
                    value
                  }
                  customer
                  discountApplications(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  note
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
                      # ...
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
                      # ...
                    }
                    name
                    orderNumber
                    phone
                    processedAt
                    shippingAddress {
                      # ...
                    }
                    shippingDiscountAllocations {
                      # ...
                    }
                    statusUrl
                    subtotalPrice
                    successfulFulfillments(first: Int) {
                      # ...
                    }
                    totalPrice
                    totalRefunded
                    totalShippingPrice
                    totalTax
                  }
                  orderStatusUrl
                  paymentDue
                  ready
                  requiresShipping
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
                      # ...
                    }
                    discountApplication {
                      # ...
                    }
                  }
                  shippingLine {
                    handle
                    price
                    title
                  }
                  subtotalPrice
                  taxExempt
                  taxesIncluded
                  totalPrice
                  totalTax
                  updatedAt
                  webUrl
                }
                lastName
                orders(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false,
                  sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                  query: ""
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
                phone
                updatedAt
              }
              customerAccessToken {
                accessToken
                expiresAt
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerReset: {
              customer: {
                acceptsMarketing: 'Boolean',
                addresses: {
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
                createdAt: 'DateTime',
                defaultAddress: {
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
                displayName: 'String',
                email: 'String',
                firstName: 'String',
                id: 'ID',
                lastIncompleteCheckout: {
                  appliedGiftCards: {
                    amountUsed: 'Money',
                    balance: 'Money',
                    id: 'ID',
                    lastCharacters: 'String',
                  },
                  availableShippingRates: {
                    ready: 'Boolean',
                    shippingRates: {
                      # ...
                    },
                  },
                  completedAt: 'DateTime',
                  createdAt: 'DateTime',
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customAttributes: {
                    key: 'String',
                    value: 'String',
                  },
                  customer: 'Customer...',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  note: 'String',
                  order: {
                    currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                    customerLocale: 'String',
                    customerUrl: 'URL',
                    discountApplications: {
                      # ...
                    },
                    email: 'String',
                    id: 'ID',
                    lineItems: {
                      # ...
                    },
                    name: 'String',
                    orderNumber: 'Int',
                    phone: 'String',
                    processedAt: 'DateTime',
                    shippingAddress: {
                      # ...
                    },
                    shippingDiscountAllocations: {
                      # ...
                    },
                    statusUrl: 'URL',
                    subtotalPrice: 'Money',
                    successfulFulfillments: {
                      # ...
                    },
                    totalPrice: 'Money',
                    totalRefunded: 'Money',
                    totalShippingPrice: 'Money',
                    totalTax: 'Money',
                  },
                  orderStatusUrl: 'URL',
                  paymentDue: 'Money',
                  ready: 'Boolean',
                  requiresShipping: 'Boolean',
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  shippingLine: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                  subtotalPrice: 'Money',
                  taxExempt: 'Boolean',
                  taxesIncluded: 'Boolean',
                  totalPrice: 'Money',
                  totalTax: 'Money',
                  updatedAt: 'DateTime',
                  webUrl: 'URL',
                },
                lastName: 'String',
                orders: {
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
                phone: 'String',
                updatedAt: 'DateTime',
              },
              customerAccessToken: {
                accessToken: 'String',
                expiresAt: 'DateTime',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # customerResetByUrl: Resets a customer’s password with the reset password url received from `CustomerRecover`.
    # @param reset_url [Types::URL!]
    # @param password [Types::String!]
    # @return [Payloads::CustomerResetByUrl]
    describe 'customerResetByUrl' do
      let!(:query) {
        %q{
          mutation {
            customerResetByUrl(
              resetUrl: "URL",
              password: ""
            ) {
              customer {
                acceptsMarketing
                addresses(
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
                createdAt
                defaultAddress {
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
                displayName
                email
                firstName
                id
                lastIncompleteCheckout {
                  appliedGiftCards {
                    amountUsed
                    balance
                    id
                    lastCharacters
                  }
                  availableShippingRates {
                    ready
                    shippingRates {
                      # ...
                    }
                  }
                  completedAt
                  createdAt
                  currencyCode
                  customAttributes {
                    key
                    value
                  }
                  customer
                  discountApplications(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  note
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
                      # ...
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
                      # ...
                    }
                    name
                    orderNumber
                    phone
                    processedAt
                    shippingAddress {
                      # ...
                    }
                    shippingDiscountAllocations {
                      # ...
                    }
                    statusUrl
                    subtotalPrice
                    successfulFulfillments(first: Int) {
                      # ...
                    }
                    totalPrice
                    totalRefunded
                    totalShippingPrice
                    totalTax
                  }
                  orderStatusUrl
                  paymentDue
                  ready
                  requiresShipping
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
                      # ...
                    }
                    discountApplication {
                      # ...
                    }
                  }
                  shippingLine {
                    handle
                    price
                    title
                  }
                  subtotalPrice
                  taxExempt
                  taxesIncluded
                  totalPrice
                  totalTax
                  updatedAt
                  webUrl
                }
                lastName
                orders(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false,
                  sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                  query: ""
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
                phone
                updatedAt
              }
              customerAccessToken {
                accessToken
                expiresAt
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerResetByUrl: {
              customer: {
                acceptsMarketing: 'Boolean',
                addresses: {
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
                createdAt: 'DateTime',
                defaultAddress: {
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
                displayName: 'String',
                email: 'String',
                firstName: 'String',
                id: 'ID',
                lastIncompleteCheckout: {
                  appliedGiftCards: {
                    amountUsed: 'Money',
                    balance: 'Money',
                    id: 'ID',
                    lastCharacters: 'String',
                  },
                  availableShippingRates: {
                    ready: 'Boolean',
                    shippingRates: {
                      # ...
                    },
                  },
                  completedAt: 'DateTime',
                  createdAt: 'DateTime',
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customAttributes: {
                    key: 'String',
                    value: 'String',
                  },
                  customer: 'Customer...',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  note: 'String',
                  order: {
                    currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                    customerLocale: 'String',
                    customerUrl: 'URL',
                    discountApplications: {
                      # ...
                    },
                    email: 'String',
                    id: 'ID',
                    lineItems: {
                      # ...
                    },
                    name: 'String',
                    orderNumber: 'Int',
                    phone: 'String',
                    processedAt: 'DateTime',
                    shippingAddress: {
                      # ...
                    },
                    shippingDiscountAllocations: {
                      # ...
                    },
                    statusUrl: 'URL',
                    subtotalPrice: 'Money',
                    successfulFulfillments: {
                      # ...
                    },
                    totalPrice: 'Money',
                    totalRefunded: 'Money',
                    totalShippingPrice: 'Money',
                    totalTax: 'Money',
                  },
                  orderStatusUrl: 'URL',
                  paymentDue: 'Money',
                  ready: 'Boolean',
                  requiresShipping: 'Boolean',
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  shippingLine: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                  subtotalPrice: 'Money',
                  taxExempt: 'Boolean',
                  taxesIncluded: 'Boolean',
                  totalPrice: 'Money',
                  totalTax: 'Money',
                  updatedAt: 'DateTime',
                  webUrl: 'URL',
                },
                lastName: 'String',
                orders: {
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
                phone: 'String',
                updatedAt: 'DateTime',
              },
              customerAccessToken: {
                accessToken: 'String',
                expiresAt: 'DateTime',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # customerUpdate: Updates an existing customer.
    # @param customer_access_token [Types::String!]
    # @param customer [Inputs::CustomerUpdate!]
    # @return [Payloads::CustomerUpdate]
    describe 'customerUpdate' do
      let!(:query) {
        %q{
          mutation {
            customerUpdate(
              customerAccessToken: "",
              customer: {
                firstName: "String",
                lastName: "String",
                email: "String",
                phone: "String",
                password: "String",
                acceptsMarketing: "Boolean"
              }
            ) {
              customer {
                acceptsMarketing
                addresses(
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
                createdAt
                defaultAddress {
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
                displayName
                email
                firstName
                id
                lastIncompleteCheckout {
                  appliedGiftCards {
                    amountUsed
                    balance
                    id
                    lastCharacters
                  }
                  availableShippingRates {
                    ready
                    shippingRates {
                      # ...
                    }
                  }
                  completedAt
                  createdAt
                  currencyCode
                  customAttributes {
                    key
                    value
                  }
                  customer
                  discountApplications(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      # ...
                    }
                    pageInfo {
                      # ...
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
                      # ...
                    }
                    pageInfo {
                      # ...
                    }
                  }
                  note
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
                      # ...
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
                      # ...
                    }
                    name
                    orderNumber
                    phone
                    processedAt
                    shippingAddress {
                      # ...
                    }
                    shippingDiscountAllocations {
                      # ...
                    }
                    statusUrl
                    subtotalPrice
                    successfulFulfillments(first: Int) {
                      # ...
                    }
                    totalPrice
                    totalRefunded
                    totalShippingPrice
                    totalTax
                  }
                  orderStatusUrl
                  paymentDue
                  ready
                  requiresShipping
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
                      # ...
                    }
                    discountApplication {
                      # ...
                    }
                  }
                  shippingLine {
                    handle
                    price
                    title
                  }
                  subtotalPrice
                  taxExempt
                  taxesIncluded
                  totalPrice
                  totalTax
                  updatedAt
                  webUrl
                }
                lastName
                orders(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false,
                  sortKey: "PROCESSED_AT | TOTAL_PRICE | ID | RELEVANCE",
                  query: ""
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
                phone
                updatedAt
              }
              customerAccessToken {
                accessToken
                expiresAt
              }
              customerUserErrors {
                code
                field
                message
              }
              userErrors {
                field
                message
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            customerUpdate: {
              customer: {
                acceptsMarketing: 'Boolean',
                addresses: {
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
                createdAt: 'DateTime',
                defaultAddress: {
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
                displayName: 'String',
                email: 'String',
                firstName: 'String',
                id: 'ID',
                lastIncompleteCheckout: {
                  appliedGiftCards: {
                    amountUsed: 'Money',
                    balance: 'Money',
                    id: 'ID',
                    lastCharacters: 'String',
                  },
                  availableShippingRates: {
                    ready: 'Boolean',
                    shippingRates: {
                      # ...
                    },
                  },
                  completedAt: 'DateTime',
                  createdAt: 'DateTime',
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  customAttributes: {
                    key: 'String',
                    value: 'String',
                  },
                  customer: 'Customer...',
                  discountApplications: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  email: 'String',
                  id: 'ID',
                  lineItems: {
                    edges: {
                      # ...
                    },
                    pageInfo: {
                      # ...
                    },
                  },
                  note: 'String',
                  order: {
                    currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                    customerLocale: 'String',
                    customerUrl: 'URL',
                    discountApplications: {
                      # ...
                    },
                    email: 'String',
                    id: 'ID',
                    lineItems: {
                      # ...
                    },
                    name: 'String',
                    orderNumber: 'Int',
                    phone: 'String',
                    processedAt: 'DateTime',
                    shippingAddress: {
                      # ...
                    },
                    shippingDiscountAllocations: {
                      # ...
                    },
                    statusUrl: 'URL',
                    subtotalPrice: 'Money',
                    successfulFulfillments: {
                      # ...
                    },
                    totalPrice: 'Money',
                    totalRefunded: 'Money',
                    totalShippingPrice: 'Money',
                    totalTax: 'Money',
                  },
                  orderStatusUrl: 'URL',
                  paymentDue: 'Money',
                  ready: 'Boolean',
                  requiresShipping: 'Boolean',
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
                      # ...
                    },
                    discountApplication: {
                      # ...
                    },
                  },
                  shippingLine: {
                    handle: 'String',
                    price: 'Money',
                    title: 'String',
                  },
                  subtotalPrice: 'Money',
                  taxExempt: 'Boolean',
                  taxesIncluded: 'Boolean',
                  totalPrice: 'Money',
                  totalTax: 'Money',
                  updatedAt: 'DateTime',
                  webUrl: 'URL',
                },
                lastName: 'String',
                orders: {
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
                phone: 'String',
                updatedAt: 'DateTime',
              },
              customerAccessToken: {
                accessToken: 'String',
                expiresAt: 'DateTime',
              },
              customerUserErrors: {
                code: 'BLANK | INVALID | TAKEN | TOO_LONG | TOO_SHORT | UNIDENTIFIED_CUSTOMER | CUSTOMER_DISABLED | PASSWORD_STARTS_OR_ENDS_WITH_WHITESPACE | CONTAINS_HTML_TAGS | CONTAINS_URL',
                field: 'String',
                message: 'String',
              },
              userErrors: {
                field: 'String',
                message: 'String',
              },
            },
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