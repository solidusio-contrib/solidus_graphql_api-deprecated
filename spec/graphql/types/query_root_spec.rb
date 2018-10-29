# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::QueryRoot' do
    let!(:query_root) { create(:query_root) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # articles: List of the shop's articles.
    # @param reverse [Types::Boolean] (false)
    # @param sort_key [Types::ArticleSortKeys] ('ID')
    # @param query [Types::String]
    # @return [Types::Article.connection_type!]
    describe 'articles' do
      let!(:query) {
        %q{
          query {
            queryRoot {
              articles(
                first: Int,
                after: "",
                last: Int,
                before: "",
                reverse: false,
                sortKey: "TITLE | BLOG_TITLE | AUTHOR | UPDATED_AT | PUBLISHED_AT | ID | RELEVANCE",
                query: ""
              ) {
                edges {
                  node {
                    author {
                      bio
                      email
                      firstName
                      lastName
                      name
                    }
                    authorV2 {
                      bio
                      email
                      firstName
                      lastName
                      name
                    }
                    blog {
                      articleByHandle(handle: "")
                      articles(
                        first: Int,
                        after: "",
                        last: Int,
                        before: "",
                        reverse: false
                      ) {
                        # ...
                      }
                      authors {
                        # ...
                      }
                      handle
                      id
                      title
                      url
                    }
                    comments(
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
                    content(truncateAt: Int)
                    contentHtml
                    excerpt(truncateAt: Int)
                    excerptHtml
                    handle
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
                    publishedAt
                    tags
                    title
                    url
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
            queryRoot: {
              articles: {
                edges: {
                  node: [{
                    author: {
                      bio: 'String',
                      email: 'String',
                      firstName: 'String',
                      lastName: 'String',
                      name: 'String',
                    },
                    authorV2: {
                      bio: 'String',
                      email: 'String',
                      firstName: 'String',
                      lastName: 'String',
                      name: 'String',
                    },
                    blog: {
                      articleByHandle: 'Article...',
                      articles: {
                        # ...
                      },
                      authors: {
                        # ...
                      },
                      handle: 'String',
                      id: 'ID',
                      title: 'String',
                      url: 'URL',
                    },
                    comments: {
                      edges: {
                        # ...
                      },
                      pageInfo: {
                        # ...
                      },
                    },
                    content: 'String',
                    contentHtml: 'HTML',
                    excerpt: 'String',
                    excerptHtml: 'HTML',
                    handle: 'String',
                    id: 'ID',
                    image: {
                      altText: 'String',
                      id: 'ID',
                      originalSrc: 'URL',
                      src: 'URL',
                      transformedSrc: 'URL',
                    },
                    publishedAt: 'DateTime',
                    tags: 'String',
                    title: 'String',
                    url: 'URL',
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

    # blogByHandle: Find a blog by its handle.
    # @param handle [Types::String!]
    # @return [Types::Blog]
    describe 'blogByHandle' do
      let!(:query) {
        %q{
          query {
            queryRoot {
              blogByHandle(handle: "") {
                articleByHandle(handle: "") {
                  author {
                    bio
                    email
                    firstName
                    lastName
                    name
                  }
                  authorV2 {
                    bio
                    email
                    firstName
                    lastName
                    name
                  }
                  blog
                  comments(
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
                  content(truncateAt: Int)
                  contentHtml
                  excerpt(truncateAt: Int)
                  excerptHtml
                  handle
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
                  publishedAt
                  tags
                  title
                  url
                }
                articles(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false
                ) {
                  edges {
                    node {
                      author {
                        # ...
                      }
                      authorV2 {
                        # ...
                      }
                      blog
                      comments(
                        first: Int,
                        after: "",
                        last: Int,
                        before: "",
                        reverse: false
                      ) {
                        # ...
                      }
                      content(truncateAt: Int)
                      contentHtml
                      excerpt(truncateAt: Int)
                      excerptHtml
                      handle
                      id
                      image(
                        maxWidth: Int,
                        maxHeight: Int,
                        crop: "CENTER | TOP | BOTTOM | LEFT | RIGHT",
                        scale: Int
                      ) {
                        # ...
                      }
                      publishedAt
                      tags
                      title
                      url
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                authors {
                  bio
                  email
                  firstName
                  lastName
                  name
                }
                handle
                id
                title
                url
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            queryRoot: {
              blogByHandle: {
                articleByHandle: {
                  author: {
                    bio: 'String',
                    email: 'String',
                    firstName: 'String',
                    lastName: 'String',
                    name: 'String',
                  },
                  authorV2: {
                    bio: 'String',
                    email: 'String',
                    firstName: 'String',
                    lastName: 'String',
                    name: 'String',
                  },
                  blog: 'Blog...',
                  comments: {
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
                  content: 'String',
                  contentHtml: 'HTML',
                  excerpt: 'String',
                  excerptHtml: 'HTML',
                  handle: 'String',
                  id: 'ID',
                  image: {
                    altText: 'String',
                    id: 'ID',
                    originalSrc: 'URL',
                    src: 'URL',
                    transformedSrc: 'URL',
                  },
                  publishedAt: 'DateTime',
                  tags: 'String',
                  title: 'String',
                  url: 'URL',
                },
                articles: {
                  edges: {
                    node: [{
                      author: {
                        # ...
                      },
                      authorV2: {
                        # ...
                      },
                      blog: 'Blog...',
                      comments: {
                        # ...
                      },
                      content: 'String',
                      contentHtml: 'HTML',
                      excerpt: 'String',
                      excerptHtml: 'HTML',
                      handle: 'String',
                      id: 'ID',
                      image: {
                        # ...
                      },
                      publishedAt: 'DateTime',
                      tags: 'String',
                      title: 'String',
                      url: 'URL',
                    }],
                  },
                  pageInfo: {
                    hasNextPage: true,
                    hasPreviousPage: false,
                  },
                },
                authors: {
                  bio: 'String',
                  email: 'String',
                  firstName: 'String',
                  lastName: 'String',
                  name: 'String',
                },
                handle: 'String',
                id: 'ID',
                title: 'String',
                url: 'URL',
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

    # blogs: List of the shop's blogs.
    # @param reverse [Types::Boolean] (false)
    # @param sort_key [Types::BlogSortKeys] ('ID')
    # @param query [Types::String]
    # @return [Types::Blog.connection_type!]
    describe 'blogs' do
      let!(:query) {
        %q{
          query {
            queryRoot {
              blogs(
                first: Int,
                after: "",
                last: Int,
                before: "",
                reverse: false,
                sortKey: "HANDLE | TITLE | ID | RELEVANCE",
                query: ""
              ) {
                edges {
                  node {
                    articleByHandle(handle: "") {
                      author {
                        # ...
                      }
                      authorV2 {
                        # ...
                      }
                      blog
                      comments(
                        first: Int,
                        after: "",
                        last: Int,
                        before: "",
                        reverse: false
                      ) {
                        # ...
                      }
                      content(truncateAt: Int)
                      contentHtml
                      excerpt(truncateAt: Int)
                      excerptHtml
                      handle
                      id
                      image(
                        maxWidth: Int,
                        maxHeight: Int,
                        crop: "CENTER | TOP | BOTTOM | LEFT | RIGHT",
                        scale: Int
                      ) {
                        # ...
                      }
                      publishedAt
                      tags
                      title
                      url
                    }
                    articles(
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
                    authors {
                      bio
                      email
                      firstName
                      lastName
                      name
                    }
                    handle
                    id
                    title
                    url
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
            queryRoot: {
              blogs: {
                edges: {
                  node: [{
                    articleByHandle: {
                      author: {
                        # ...
                      },
                      authorV2: {
                        # ...
                      },
                      blog: 'Blog...',
                      comments: {
                        # ...
                      },
                      content: 'String',
                      contentHtml: 'HTML',
                      excerpt: 'String',
                      excerptHtml: 'HTML',
                      handle: 'String',
                      id: 'ID',
                      image: {
                        # ...
                      },
                      publishedAt: 'DateTime',
                      tags: 'String',
                      title: 'String',
                      url: 'URL',
                    },
                    articles: {
                      edges: {
                        # ...
                      },
                      pageInfo: {
                        # ...
                      },
                    },
                    authors: {
                      bio: 'String',
                      email: 'String',
                      firstName: 'String',
                      lastName: 'String',
                      name: 'String',
                    },
                    handle: 'String',
                    id: 'ID',
                    title: 'String',
                    url: 'URL',
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

    # customer
    # @param customer_access_token [Types::String!]
    # @return [Types::Customer]
    describe 'customer' do
      let!(:query) {
        %q{
          query {
            queryRoot {
              customer(customerAccessToken: "") {
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
                  customer
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
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                phone
                updatedAt
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            queryRoot: {
              customer: {
                acceptsMarketing: 'Boolean',
                addresses: {
                  edges: {
                    node: [{
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
                  customer: 'Customer...',
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
                lastName: 'String',
                orders: {
                  edges: {
                    node: [{
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

    # node
    # @param id [Types::ID!]
    # @return [Interfaces::Node]
    describe 'node' do
      let!(:query) {
        %q{
          query {
            queryRoot {
              node(id: "ID") {
                id
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            queryRoot: {
              node: {
                id: 'ID',
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

    # nodes
    # @param ids [[Types::ID!]!]
    # @return [[Interfaces::Node]!]
    describe 'nodes' do
      let!(:query) {
        %q{
          query {
            queryRoot {
              nodes(ids: ["ID"]) {
                id
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            queryRoot: {
              nodes: [{
                id: 'ID',
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

    # shop
    # @return [Types::Shop!]
    describe 'shop' do
      let!(:query) {
        %q{
          query {
            queryRoot {
              shop {
                articles(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false,
                  sortKey: "TITLE | BLOG_TITLE | AUTHOR | UPDATED_AT | PUBLISHED_AT | ID | RELEVANCE",
                  query: ""
                ) {
                  edges {
                    node {
                      author {
                        # ...
                      }
                      authorV2 {
                        # ...
                      }
                      blog {
                        # ...
                      }
                      comments(
                        first: Int,
                        after: "",
                        last: Int,
                        before: "",
                        reverse: false
                      ) {
                        # ...
                      }
                      content(truncateAt: Int)
                      contentHtml
                      excerpt(truncateAt: Int)
                      excerptHtml
                      handle
                      id
                      image(
                        maxWidth: Int,
                        maxHeight: Int,
                        crop: "CENTER | TOP | BOTTOM | LEFT | RIGHT",
                        scale: Int
                      ) {
                        # ...
                      }
                      publishedAt
                      tags
                      title
                      url
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                blogs(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false,
                  sortKey: "HANDLE | TITLE | ID | RELEVANCE",
                  query: ""
                ) {
                  edges {
                    node {
                      articleByHandle(handle: "") {
                        # ...
                      }
                      articles(
                        first: Int,
                        after: "",
                        last: Int,
                        before: "",
                        reverse: false
                      ) {
                        # ...
                      }
                      authors {
                        # ...
                      }
                      handle
                      id
                      title
                      url
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                cardVaultUrl
                collectionByHandle(handle: "") {
                  description(truncateAt: Int)
                  descriptionHtml
                  handle
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
                  products(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "TITLE | PRICE | BEST_SELLING | CREATED | ID | MANUAL | COLLECTION_DEFAULT | RELEVANCE"
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
                  title
                  updatedAt
                }
                collections(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false,
                  sortKey: "TITLE | UPDATED_AT | ID | RELEVANCE",
                  query: ""
                ) {
                  edges {
                    node {
                      description(truncateAt: Int)
                      descriptionHtml
                      handle
                      id
                      image(
                        maxWidth: Int,
                        maxHeight: Int,
                        crop: "CENTER | TOP | BOTTOM | LEFT | RIGHT",
                        scale: Int
                      ) {
                        # ...
                      }
                      products(
                        first: Int,
                        after: "",
                        last: Int,
                        before: "",
                        reverse: false,
                        sortKey: "TITLE | PRICE | BEST_SELLING | CREATED | ID | MANUAL | COLLECTION_DEFAULT | RELEVANCE"
                      ) {
                        # ...
                      }
                      title
                      updatedAt
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                currencyCode
                description
                moneyFormat
                name
                paymentSettings {
                  acceptedCardBrands
                  cardVaultUrl
                  countryCode
                  currencyCode
                  solidusPaymentsAccountId
                  supportedDigitalWallets
                }
                primaryDomain {
                  host
                  sslEnabled
                  url
                }
                privacyPolicy {
                  body
                  id
                  title
                  url
                }
                productByHandle(handle: "") {
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
                  ) {
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
                    product
                    selectedOptions {
                      name
                      value
                    }
                    sku
                    title
                    weight
                    weightUnit
                  }
                  variants(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false,
                    sortKey: "TITLE | SKU | POSITION | ID | RELEVANCE"
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
                  vendor
                }
                productTypes(first: Int) {
                  edges {
                    node
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                products(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false,
                  sortKey: "TITLE | PRODUCT_TYPE | VENDOR | UPDATED_AT | CREATED_AT | BEST_SELLING | PRICE | ID | RELEVANCE",
                  query: ""
                ) {
                  edges {
                    node {
                      availableForSale
                      collections(
                        first: Int,
                        after: "",
                        last: Int,
                        before: "",
                        reverse: false
                      ) {
                        # ...
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
                        # ...
                      }
                      onlineStoreUrl
                      options(first: Int) {
                        # ...
                      }
                      priceRange {
                        # ...
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
                      ) {
                        # ...
                      }
                      variants(
                        first: Int,
                        after: "",
                        last: Int,
                        before: "",
                        reverse: false,
                        sortKey: "TITLE | SKU | POSITION | ID | RELEVANCE"
                      ) {
                        # ...
                      }
                      vendor
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                refundPolicy {
                  body
                  id
                  title
                  url
                }
                shipsToCountries
                solidusPaymentsAccountId
                termsOfService {
                  body
                  id
                  title
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
            queryRoot: {
              shop: {
                articles: {
                  edges: {
                    node: [{
                      author: {
                        # ...
                      },
                      authorV2: {
                        # ...
                      },
                      blog: {
                        # ...
                      },
                      comments: {
                        # ...
                      },
                      content: 'String',
                      contentHtml: 'HTML',
                      excerpt: 'String',
                      excerptHtml: 'HTML',
                      handle: 'String',
                      id: 'ID',
                      image: {
                        # ...
                      },
                      publishedAt: 'DateTime',
                      tags: 'String',
                      title: 'String',
                      url: 'URL',
                    }],
                  },
                  pageInfo: {
                    hasNextPage: true,
                    hasPreviousPage: false,
                  },
                },
                blogs: {
                  edges: {
                    node: [{
                      articleByHandle: {
                        # ...
                      },
                      articles: {
                        # ...
                      },
                      authors: {
                        # ...
                      },
                      handle: 'String',
                      id: 'ID',
                      title: 'String',
                      url: 'URL',
                    }],
                  },
                  pageInfo: {
                    hasNextPage: true,
                    hasPreviousPage: false,
                  },
                },
                cardVaultUrl: 'URL',
                collectionByHandle: {
                  description: 'String',
                  descriptionHtml: 'HTML',
                  handle: 'String',
                  id: 'ID',
                  image: {
                    altText: 'String',
                    id: 'ID',
                    originalSrc: 'URL',
                    src: 'URL',
                    transformedSrc: 'URL',
                  },
                  products: {
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
                  title: 'String',
                  updatedAt: 'DateTime',
                },
                collections: {
                  edges: {
                    node: [{
                      description: 'String',
                      descriptionHtml: 'HTML',
                      handle: 'String',
                      id: 'ID',
                      image: {
                        # ...
                      },
                      products: {
                        # ...
                      },
                      title: 'String',
                      updatedAt: 'DateTime',
                    }],
                  },
                  pageInfo: {
                    hasNextPage: true,
                    hasPreviousPage: false,
                  },
                },
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                description: 'String',
                moneyFormat: 'String',
                name: 'String',
                paymentSettings: {
                  acceptedCardBrands: 'VISA | MASTERCARD | DISCOVER | AMERICAN_EXPRESS | DINERS_CLUB | JCB',
                  cardVaultUrl: 'URL',
                  countryCode: 'AF | AX | AL | DZ | AD | AO | AI | AG | AR | AM | AW | AU | AT | AZ | BS | BH | BD | BB | BY | BE | BZ | BJ | BM | BT | BO | BQ | BA | BW | BV | BR | IO | BN | BG | BF | BI | KH | CA | CV | KY | CF | TD | CL | CN | CX | CC | CO | KM | CG | CD | CK | CR | HR | CU | CW | CY | CZ | CI | DK | DJ | DM | DO | EC | EG | SV | GQ | ER | EE | ET | FK | FO | FJ | FI | FR | GF | PF | TF | GA | GM | GE | DE | GH | GI | GR | GL | GD | GP | GT | GG | GN | GW | GY | HT | HM | VA | HN | HK | HU | IS | IN | ID | IR | IQ | IE | IM | IL | IT | JM | JP | JE | JO | KZ | KE | KI | KP | XK | KW | KG | LA | LV | LB | LS | LR | LY | LI | LT | LU | MO | MK | MG | MW | MY | MV | ML | MT | MQ | MR | MU | YT | MX | MD | MC | MN | ME | MS | MA | MZ | MM | NA | NR | NP | NL | AN | NC | NZ | NI | NE | NG | NU | NF | NO | OM | PK | PS | PA | PG | PY | PE | PH | PN | PL | PT | QA | CM | RE | RO | RU | RW | BL | SH | KN | LC | MF | PM | WS | SM | ST | SA | SN | RS | SC | SL | SG | SX | SK | SI | SB | SO | ZA | GS | KR | SS | ES | LK | VC | SD | SR | SJ | SZ | SE | CH | SY | TW | TJ | TZ | TH | TL | TG | TK | TO | TT | TN | TR | TM | TC | TV | UG | UA | AE | GB | US | UM | UY | UZ | VU | VE | VN | VG | WF | EH | YE | ZM | ZW',
                  currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                  solidusPaymentsAccountId: 'String',
                  supportedDigitalWallets: 'APPLE_PAY | ANDROID_PAY | GOOGLE_PAY | SOLIDUS_PAY',
                },
                primaryDomain: {
                  host: 'String',
                  sslEnabled: 'Boolean',
                  url: 'URL',
                },
                privacyPolicy: {
                  body: 'String',
                  id: 'ID',
                  title: 'String',
                  url: 'URL',
                },
                productByHandle: {
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
                  variantBySelectedOptions: {
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
                    product: 'Product...',
                    selectedOptions: {
                      name: 'String',
                      value: 'String',
                    },
                    sku: 'String',
                    title: 'String',
                    weight: 'Float',
                    weightUnit: 'KILOGRAMS | GRAMS | POUNDS | OUNCES',
                  },
                  variants: {
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
                  vendor: 'String',
                },
                productTypes: {
                  edges: {
                    node: ['String'],
                  },
                  pageInfo: {
                    hasNextPage: true,
                    hasPreviousPage: false,
                  },
                },
                products: {
                  edges: {
                    node: [{
                      availableForSale: 'Boolean',
                      collections: {
                        # ...
                      },
                      createdAt: 'DateTime',
                      description: 'String',
                      descriptionHtml: 'HTML',
                      handle: 'String',
                      id: 'ID',
                      images: {
                        # ...
                      },
                      onlineStoreUrl: 'URL',
                      options: {
                        # ...
                      },
                      priceRange: {
                        # ...
                      },
                      productType: 'String',
                      publishedAt: 'DateTime',
                      tags: 'String',
                      title: 'String',
                      updatedAt: 'DateTime',
                      variantBySelectedOptions: {
                        # ...
                      },
                      variants: {
                        # ...
                      },
                      vendor: 'String',
                    }],
                  },
                  pageInfo: {
                    hasNextPage: true,
                    hasPreviousPage: false,
                  },
                },
                refundPolicy: {
                  body: 'String',
                  id: 'ID',
                  title: 'String',
                  url: 'URL',
                },
                shipsToCountries: 'AF | AX | AL | DZ | AD | AO | AI | AG | AR | AM | AW | AU | AT | AZ | BS | BH | BD | BB | BY | BE | BZ | BJ | BM | BT | BO | BQ | BA | BW | BV | BR | IO | BN | BG | BF | BI | KH | CA | CV | KY | CF | TD | CL | CN | CX | CC | CO | KM | CG | CD | CK | CR | HR | CU | CW | CY | CZ | CI | DK | DJ | DM | DO | EC | EG | SV | GQ | ER | EE | ET | FK | FO | FJ | FI | FR | GF | PF | TF | GA | GM | GE | DE | GH | GI | GR | GL | GD | GP | GT | GG | GN | GW | GY | HT | HM | VA | HN | HK | HU | IS | IN | ID | IR | IQ | IE | IM | IL | IT | JM | JP | JE | JO | KZ | KE | KI | KP | XK | KW | KG | LA | LV | LB | LS | LR | LY | LI | LT | LU | MO | MK | MG | MW | MY | MV | ML | MT | MQ | MR | MU | YT | MX | MD | MC | MN | ME | MS | MA | MZ | MM | NA | NR | NP | NL | AN | NC | NZ | NI | NE | NG | NU | NF | NO | OM | PK | PS | PA | PG | PY | PE | PH | PN | PL | PT | QA | CM | RE | RO | RU | RW | BL | SH | KN | LC | MF | PM | WS | SM | ST | SA | SN | RS | SC | SL | SG | SX | SK | SI | SB | SO | ZA | GS | KR | SS | ES | LK | VC | SD | SR | SJ | SZ | SE | CH | SY | TW | TJ | TZ | TH | TL | TG | TK | TO | TT | TN | TR | TM | TC | TV | UG | UA | AE | GB | US | UM | UY | UZ | VU | VE | VN | VG | WF | EH | YE | ZM | ZW',
                solidusPaymentsAccountId: 'String',
                termsOfService: {
                  body: 'String',
                  id: 'ID',
                  title: 'String',
                  url: 'URL',
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
  end
end