# frozen_string_literal: true

require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Shop' do
    let!(:shop) {
      s = create(:store)
      s.update(
        default_currency: 'USD',
        cart_tax_country_iso: 'US',
      )
      s
    }
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
                #acceptedCardBrands
                #cardVaultUrl
                countryCode
                currencyCode
                #solidusPaymentsAccountId
                #supportedDigitalWallets
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
                #acceptedCardBrands: 'VISA | MASTERCARD | DISCOVER | AMERICAN_EXPRESS | DINERS_CLUB | JCB',
                #cardVaultUrl: 'URL',
                countryCode: 'US',
                currencyCode: 'USD',
                #solidusPaymentsAccountId: 'String',
                #supportedDigitalWallets: 'APPLE_PAY | ANDROID_PAY | GOOGLE_PAY | SOLIDUS_PAY',
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
      let(:available_countries_isos) { %w[IT US] }
      let(:available_countries) { double(:available_countries, map: available_countries_isos) }
      let!(:ctx) do
        {
          current_store: current_store,
          helpers: double(:helpers)
        }
      end
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
              shipsToCountries: available_countries_isos,
            }
          },
          #errors: {},
        }
      }
      it 'succeeds' do
        expect(ctx[:helpers]).to receive(:available_countries).once.with(no_args).and_return(available_countries)
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
