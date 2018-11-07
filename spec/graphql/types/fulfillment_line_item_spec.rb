# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::FulfillmentLineItem' do
    let!(:fulfillment_line_item) { create(:fulfillment_line_item) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # lineItem: The associated order's line item.
    # @return [Types::OrderLineItem!]
    describe 'lineItem' do
      let!(:query) {
        %q{
          query {
            fulfillmentLineItem {
              lineItem {
                customAttributes {
                  key
                  value
                }
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
                        # ...
                      }
                      pageInfo {
                        # ...
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
                        # ...
                      }
                      pageInfo {
                        # ...
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
                        # ...
                      }
                      minVariantPrice {
                        # ...
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
                        # ...
                      }
                      pageInfo {
                        # ...
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
      }
      let!(:result) {
        {
          data: {
            fulfillmentLineItem: {
              lineItem: {
                customAttributes: {
                  key: 'String',
                  value: 'String',
                },
                discountAllocations: {
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
                quantity: 'Int',
                title: 'String',
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
                        # ...
                      },
                      pageInfo: {
                        # ...
                      },
                    },
                    createdAt: 'DateTime',
                    description: 'String',
                    descriptionHtml: 'HTML',
                    handle: 'String',
                    id: 'ID',
                    images: {
                      edges: {
                        # ...
                      },
                      pageInfo: {
                        # ...
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
                        # ...
                      },
                      minVariantPrice: {
                        # ...
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
                        # ...
                      },
                      pageInfo: {
                        # ...
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

    # quantity: The amount fulfilled in this fulfillment.
    # @return [Types::Int!]
    describe 'quantity' do
      let!(:query) {
        %q{
          query {
            fulfillmentLineItem {
              quantity
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            fulfillmentLineItem: {
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
  end
end