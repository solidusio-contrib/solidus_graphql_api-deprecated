# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Shop' do
    let!(:shop) { create(:store) }
    let!(:products) { create_list(:product, 10) }
    # Taxonomy factory implicitly creates a taxon.
    let!(:taxonomies) { create_list(:taxonomy, 10) }
    let!(:taxon) {
      t = taxonomies.first.taxons.first
      t.permalink = 'taxon-one'
      t.save
      t
    }
    let!(:product) {
      p = products.first
      p.taxons = [taxon]
      p.save
      p
    }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # collectionByHandle: Find a collection by its handle.
    # @param handle [Types::String!]
    # @return [Types::Collection]
    describe 'collectionByHandle' do
      let!(:variables) { { collection_handle: taxon.permalink } }
      let!(:query) {
        %q{
          query($collection_handle: String!) {
            shop {
              collectionByHandle(handle: $collection_handle) {
                id
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            shop: {
              collectionByHandle: {
                id: ::Spree::GraphQL::Schema::Schema.id_from_object(taxon),
              },
            }
          },
          #errors: {},
        }
      }
      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    # collections: List of the shop’s collections.
    # @param reverse [Types::Boolean] (false)
    # @param sort_key [Types::CollectionSortKeys] ('ID')
    # @param query [Types::String]
    # @return [Types::Collection.connection_type!]
    describe 'collections' do
      let!(:query) {
        %q{
          query {
            shop {
              collections(
                first: 1
              ) {
                edges { node { title id } }
                pageInfo { hasNextPage hasPreviousPage }
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            shop: {
              collections: {
                edges: [{
                  node: {
                    id: ::Spree::GraphQL::Schema::Schema.id_from_object(taxonomies.first),
                    title: taxonomies.first.name,
                  },
                }],
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
      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end

      context 'reverse' do
        let!(:query) {
          %q{
            query {
              shop {
                collections(
                  first: 1
                  reverse: true,
                ) {
                  edges { node { title id } }
                  pageInfo { hasNextPage hasPreviousPage }
                }
              }
            }
          }
        }
        let!(:result) {
          {
            data: {
              shop: {
                collections: {
                  edges: [{
                    node: {
                      id: ::Spree::GraphQL::Schema::Schema.id_from_object(taxonomies.last),
                      title: taxonomies.last.name,
                    },
                  }],
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
        it 'succeeds' do
          execute
          expect(response_hash).to eq(result_hash)
        end
      end
      context 'sortKey' do
        context 'updatedAt' do
          let!(:query) {
            %q{
              query {
                shop {
                  collections( last: 1 reverse: false, sortKey: UPDATED_AT) {
                    edges { node { updatedAt } }
                    pageInfo { hasNextPage hasPreviousPage }
                  }
                }
              }
            }
          }
          let!(:result) {
            {
              data: {
                shop: {
                  collections: {
                    edges: [{
                      node: {
                        updatedAt: taxonomies.sort{|a,b| a.updated_at <=> b.updated_at }.last.updated_at.iso8601,
                      },
                    }],
                    pageInfo: {
                      hasNextPage: false,
                      hasPreviousPage: true,
                    },
                  },
                }
              },
              #errors: {},
            }
          }
          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end
        context 'title' do
          let!(:query) {
            %q{
              query {
                shop {
                  collections( first: 1 reverse: false, sortKey: TITLE) {
                    edges { node { title } }
                    pageInfo { hasNextPage hasPreviousPage }
                  }
                }
              }
            }
          }
          let!(:result) {
            {
              data: {
                shop: {
                  collections: {
                    edges: [{
                      node: {
                        title: taxonomies.sort{|a,b| a.name <=> b.name }.first.name,
                      },
                    }],
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
          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end
        context 'id' do
          let!(:query) {
            %q{
              query {
                shop {
                  collections( first: 1 reverse: true, sortKey: ID) {
                    edges { node { id } }
                    pageInfo { hasNextPage hasPreviousPage }
                  }
                }
              }
            }
          }
          let!(:result) {
            {
              data: {
                shop: {
                  collections: {
                    edges: [{
                      node: {
                        id: ::Spree::GraphQL::Schema::Schema.id_from_object(taxonomies.sort{|a,b| a.id <=> b.id }.last),
                      },
                    }],
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
          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end
      end
    end

    # description: A description of the shop.
    # @return [Types::String]
    describe 'description' do
      let!(:description) {'Sample Store Description'}
      let!(:query) {
        %q{
          query {
            shop {
              description
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            shop: {
              description: description,
            }
          },
          #errors: {},
        }
      }
      it 'succeeds' do
        ctx[:current_store].meta_description = description
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    # moneyFormat: A string representing the way currency is formatted when the currency isn’t specified.
    # @return [Types::String!]
    describe 'moneyFormat' do
      let!(:query) {
        %q{
          query {
            shop {
              moneyFormat
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            shop: {
              moneyFormat: '${{amount}}',
            }
          },
          #errors: {},
        }
      }
      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    # name: The shop’s name.
    # @return [Types::String!]
    describe 'name' do
      let!(:query) {
        %q{
          query {
            shop {
              name
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            shop: {
              name: shop.name,
            }
          },
          #errors: {},
        }
      }
      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    # paymentSettings: Settings related to payments.
    # @return [Types::PaymentSettings!]
    describe 'paymentSettings' do
      let!(:query) {
        %q{
          query {
            shop {
              paymentSettings {
                acceptedCardBrands
                cardVaultUrl
                countryCode
                currencyCode
                solidusPaymentsAccountId
                supportedDigitalWallets
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            shop: {
              paymentSettings: {
                acceptedCardBrands: 'VISA | MASTERCARD | DISCOVER | AMERICAN_EXPRESS | DINERS_CLUB | JCB',
                cardVaultUrl: 'URL',
                countryCode: 'AF | AX | AL | DZ | AD | AO | AI | AG | AR | AM | AW | AU | AT | AZ | BS | BH | BD | BB | BY | BE | BZ | BJ | BM | BT | BO | BQ | BA | BW | BV | BR | IO | BN | BG | BF | BI | KH | CA | CV | KY | CF | TD | CL | CN | CX | CC | CO | KM | CG | CD | CK | CR | HR | CU | CW | CY | CZ | CI | DK | DJ | DM | DO | EC | EG | SV | GQ | ER | EE | ET | FK | FO | FJ | FI | FR | GF | PF | TF | GA | GM | GE | DE | GH | GI | GR | GL | GD | GP | GT | GG | GN | GW | GY | HT | HM | VA | HN | HK | HU | IS | IN | ID | IR | IQ | IE | IM | IL | IT | JM | JP | JE | JO | KZ | KE | KI | KP | XK | KW | KG | LA | LV | LB | LS | LR | LY | LI | LT | LU | MO | MK | MG | MW | MY | MV | ML | MT | MQ | MR | MU | YT | MX | MD | MC | MN | ME | MS | MA | MZ | MM | NA | NR | NP | NL | AN | NC | NZ | NI | NE | NG | NU | NF | NO | OM | PK | PS | PA | PG | PY | PE | PH | PN | PL | PT | QA | CM | RE | RO | RU | RW | BL | SH | KN | LC | MF | PM | WS | SM | ST | SA | SN | RS | SC | SL | SG | SX | SK | SI | SB | SO | ZA | GS | KR | SS | ES | LK | VC | SD | SR | SJ | SZ | SE | CH | SY | TW | TJ | TZ | TH | TL | TG | TK | TO | TT | TN | TR | TM | TC | TV | UG | UA | AE | GB | US | UM | UY | UZ | VU | VE | VN | VG | WF | EH | YE | ZM | ZW',
                currencyCode: 'USD | EUR | GBP | CAD | AFN | ALL | DZD | AOA | ARS | AMD | AWG | AUD | BBD | AZN | BDT | BSD | BHD | BIF | BYR | BZD | BTN | BAM | BRL | BOB | BWP | BND | BGN | MMK | KHR | CVE | KYD | XAF | CLP | CNY | COP | KMF | CDF | CRC | HRK | CZK | DKK | DOP | XCD | EGP | ETB | XPF | FJD | GMD | GHS | GTQ | GYD | GEL | HTG | HNL | HKD | HUF | ISK | INR | IDR | ILS | IQD | JMD | JPY | JEP | JOD | KZT | KES | KWD | KGS | LAK | LVL | LBP | LSL | LRD | LTL | MGA | MKD | MOP | MWK | MVR | MXN | MYR | MUR | MDL | MAD | MNT | MZN | NAD | NPR | ANG | NZD | NIO | NGN | NOK | OMR | PKR | PGK | PYG | PEN | PHP | PLN | QAR | RON | RUB | RWF | WST | SAR | STD | RSD | SCR | SGD | SDG | SYP | ZAR | KRW | SSP | SBD | LKR | SRD | SZL | SEK | CHF | TWD | THB | TZS | TTD | TND | TRY | TMT | UGX | UAH | AED | UYU | UZS | VUV | VEF | VND | XOF | YER | ZMW',
                solidusPaymentsAccountId: 'String',
                supportedDigitalWallets: 'APPLE_PAY | ANDROID_PAY | GOOGLE_PAY | SOLIDUS_PAY',
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

    # primaryDomain: The shop’s primary domain.
    # @return [Types::Domain!]
    describe 'primaryDomain' do
      let!(:query) {
        %q{
          query {
            shop {
              primaryDomain {
                host
                sslEnabled
                url
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            shop: {
              primaryDomain: {
                host: ctx[:current_store].url,
                sslEnabled: Rails.configuration.force_ssl,
                url: ((@ssl_enabled ? 'https://' : 'http://') + ctx[:current_store].url),
              },
            }
          },
          #errors: {},
        }
      }
      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    # privacyPolicy: The shop’s privacy policy.
    # @return [Types::ShopPolicy]
    describe 'privacyPolicy' do
      let!(:query) {
        %q{
          query {
            shop {
              privacyPolicy {
                body
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
            shop: {
              privacyPolicy: {
                body: 'String',
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

    # productByHandle: Find a product by its handle.
    # @param handle [Types::String!]
    # @return [Types::Product]
    describe 'productByHandle' do
      let!(:variables) { { product_handle: products.first.slug } }
      let!(:query) {
        %q{
          query($product_handle: String!) {
            shop {
              productByHandle(handle: $product_handle) {
                id
                title
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            shop: {
              productByHandle: {
                id: ::Spree::GraphQL::Schema::Schema.id_from_object(products.first),
                title: products.first.name,
              },
            }
          },
          #errors: {},
        }
      }
      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    # productTypes: List of the shop’s product types.
    # @return [Types::String.connection_type!]
    describe 'productTypes' do
      let!(:query) {
        %q{
          query {
            shop {
              productTypes(first: Int) {
                edges {
                  node
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
            shop: {
              productTypes: {
                edges: {
                  node: ['String'],
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

    # products: List of the shop’s products.
    # @param reverse [Types::Boolean] (false)
    # @param sort_key [Types::ProductSortKeys] ('ID')
    # @param query [Types::String]
    # @return [Types::Product.connection_type!]
    describe 'products' do
      let!(:query) {
        %q{
          query {
            shop {
              products(
                first: 1
              ) {
                edges { node { handle id } }
                pageInfo { hasNextPage hasPreviousPage }
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            shop: {
              products: {
                edges: [{
                  node: {
                    id: ::Spree::GraphQL::Schema::Schema.id_from_object(products.first),
                    handle: products.first.slug,
                  },
                }],
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
      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end

      context 'reverse' do
        let!(:query) {
          %q{
            query {
              shop {
                products(
                  first: 1
                  reverse: true,
                ) {
                  edges { node { handle id } }
                  pageInfo { hasNextPage hasPreviousPage }
                }
              }
            }
          }
        }
        let!(:result) {
          {
            data: {
              shop: {
                products: {
                  edges: [{
                    node: {
                      id: ::Spree::GraphQL::Schema::Schema.id_from_object(products.last),
                      handle: products.last.slug,
                    },
                  }],
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
        it 'succeeds' do
          execute
          expect(response_hash).to eq(result_hash)
        end
      end
      context 'sortKey' do
        context 'createdAt' do
          let!(:query) {
            %q{
              query {
                shop {
                  products( last: 1 reverse: false, sortKey: CREATED_AT) {
                    edges { node { createdAt } }
                    pageInfo { hasNextPage hasPreviousPage }
                  }
                }
              }
            }
          }
          let!(:result) {
            {
              data: {
                shop: {
                  products: {
                    edges: [{
                      node: {
                        createdAt: products.sort{|a,b| a.created_at <=> b.created_at }.last.created_at.iso8601,
                      },
                    }],
                    pageInfo: {
                      hasNextPage: false,
                      hasPreviousPage: true,
                    },
                  },
                }
              },
              #errors: {},
            }
          }
          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end
        context 'updatedAt' do
          let!(:query) {
            %q{
              query {
                shop {
                  products( last: 1 reverse: false, sortKey: UPDATED_AT) {
                    edges { node { updatedAt } }
                    pageInfo { hasNextPage hasPreviousPage }
                  }
                }
              }
            }
          }
          let!(:result) {
            {
              data: {
                shop: {
                  products: {
                    edges: [{
                      node: {
                        updatedAt: products.sort{|a,b| a.updated_at <=> b.updated_at }.last.updated_at.iso8601,
                      },
                    }],
                    pageInfo: {
                      hasNextPage: false,
                      hasPreviousPage: true,
                    },
                  },
                }
              },
              #errors: {},
            }
          }
          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end
        context 'title' do
          let!(:query) {
            %q{
              query {
                shop {
                  products( first: 1 reverse: false, sortKey: TITLE) {
                    edges { node { title } }
                    pageInfo { hasNextPage hasPreviousPage }
                  }
                }
              }
            }
          }
          let!(:result) {
            {
              data: {
                shop: {
                  products: {
                    edges: [{
                      node: {
                        title: products.sort{|a,b| a.name <=> b.name }.first.name,
                      },
                    }],
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
          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end
        context 'id' do
          let!(:query) {
            %q{
              query {
                shop {
                  products( first: 1 reverse: true, sortKey: ID) {
                    edges { node { id } }
                    pageInfo { hasNextPage hasPreviousPage }
                  }
                }
              }
            }
          }
          let!(:result) {
            {
              data: {
                shop: {
                  products: {
                    edges: [{
                      node: {
                        id: ::Spree::GraphQL::Schema::Schema.id_from_object(products.sort{|a,b| a.id <=> b.id }.last),
                      },
                    }],
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
          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end
      end
    end

    # refundPolicy: The shop’s refund policy.
    # @return [Types::ShopPolicy]
    describe 'refundPolicy' do
      let!(:query) {
        %q{
          query {
            shop {
              refundPolicy {
                body
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
            shop: {
              refundPolicy: {
                body: 'String',
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

    # shipsToCountries: Countries that the shop ships to.
    # @return [[Types::CountryCode!]!]
    describe 'shipsToCountries' do
      include Spree::GraphQL::Helpers::BaseHelper
      let!(:query) {
        %q{
          query {
            shop {
              shipsToCountries
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            shop: {
              shipsToCountries: available_countries.map(&:iso),
            }
          },
          #errors: {},
        }
      }
      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    # termsOfService: The shop’s terms of service.
    # @return [Types::ShopPolicy]
    describe 'termsOfService' do
      let!(:query) {
        %q{
          query {
            shop {
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
      let!(:result) {
        {
          data: {
            shop: {
              termsOfService: {
                body: 'String',
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
  end
end
