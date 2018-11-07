# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::OrderLineItem' do
    let!(:order_line_item) { create(:order_line_item) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # customAttributes: List of custom attributes associated to the line item.
    # @return [[Types::Attribute!]!]
    describe 'customAttributes' do
      let!(:query) {
        %q{
          query {
            orderLineItem {
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
            orderLineItem: {
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

    # discountAllocations: The discounts that have been allocated onto the order line item by discount applications.
    # @return [[Types::DiscountAllocation!]!]
    describe 'discountAllocations' do
      let!(:query) {
        %q{
          query {
            orderLineItem {
              discountAllocations {
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
            orderLineItem: {
              discountAllocations: [{
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

    # quantity: The number of products variants associated to the line item.
    # @return [Types::Int!]
    describe 'quantity' do
      let!(:query) {
        %q{
          query {
            orderLineItem {
              quantity
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            orderLineItem: {
              quantity: 'Int',
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

    # title: The title of the product combined with title of the variant.
    # @return [Types::String!]
    describe 'title' do
      let!(:query) {
        %q{
          query {
            orderLineItem {
              title
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            orderLineItem: {
              title: 'String',
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

    # variant: The product variant object associated to the line item.
    # @return [Types::ProductVariant]
    describe 'variant' do
      let!(:query) {
        %q{
          query {
            orderLineItem {
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
                  altText
                  id
                  originalSrc
                  src
                  transformedSrc(
                    maxWidth: Int,
                    maxHeight: Int,
                    crop: "CENTER | TOP | BOTTOM | LEFT | RIGHT",
                    scale: Int,
                    preferredContentType: "PNG | JPG | WEBP"
                  )
                }
                price
                product {
                  availableForSale
                  collections(
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
                  description(truncateAt: Int)
                  descriptionHtml
                  handle
                  id
                  images(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "CREATED_AT | POSITION | ID | RELEVANCE",
                    maxWidth: Int,
                    maxHeight: Int,
                    crop: "CENTER | TOP | BOTTOM | LEFT | RIGHT",
                    scale: Int
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
                  onlineStoreUrl
                  options(first: Int) {
                    id
                    name
                    values
                  }
                  priceRange {
                    maxVariantPrice {
                      amount
                      currencyCode
                    }
                    minVariantPrice {
                      amount
                      currencyCode
                    }
                  }
                  productType
                  publishedAt
                  tags
                  title
                  updatedAt
                  variantBySelectedOptions(
                    selectedOptions: [{
                      name: "String",
                      value: "String"
                    }]
                  )
                  variants(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "TITLE | SKU | POSITION | ID | RELEVANCE"
                  ) {
                    edges {
                      node
                    }
                    pageInfo {
                      hasNextPage
                      hasPreviousPage
                    }
                  }
                  vendor
                }
                selectedOptions {
                  name
                  value
                }
                sku
                title
                weight
                weightUnit
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            orderLineItem: {
              variant: {
                available: 'Boolean',
                availableForSale: 'Boolean',
                compareAtPrice: 'Money',
                id: 'ID',
                image: {
                  altText: 'String',
                  id: 'ID',
                  originalSrc: 'URL',
                  src: 'URL',
                  transformedSrc: 'URL',
                },
                price: 'Money',
                product: {
                  availableForSale: 'Boolean',
                  collections: {
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
                  description: 'String',
                  descriptionHtml: 'HTML',
                  handle: 'String',
                  id: 'ID',
                  images: {
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
                  onlineStoreUrl: 'URL',
                  options: {
                    id: 'ID',
                    name: 'String',
                    values: 'String',
                  },
                  priceRange: {
                    maxVariantPrice: {
                      amount: 'Decimal',
                      currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                    },
                    minVariantPrice: {
                      amount: 'Decimal',
                      currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                    },
                  },
                  productType: 'String',
                  publishedAt: 'DateTime',
                  tags: 'String',
                  title: 'String',
                  updatedAt: 'DateTime',
                  variantBySelectedOptions: 'ProductVariant...',
                  variants: {
                    edges: {
                      node: ['ProductVariant...'],
                    },
                    pageInfo: {
                      hasNextPage: true,
                      hasPreviousPage: false,
                    },
                  },
                  vendor: 'String',
                },
                selectedOptions: {
                  name: 'String',
                  value: 'String',
                },
                sku: 'String',
                title: 'String',
                weight: 'Float',
                weightUnit: 'KILOGRAMS | GRAMS | POUNDS | OUNCES',
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