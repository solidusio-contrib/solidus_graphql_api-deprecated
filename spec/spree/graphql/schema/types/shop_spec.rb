# frozen_string_literal: true

require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Shop' do
    let!(:shop) do
      create :store,
             default_currency: 'USD',
             cart_tax_country_iso: 'US'
    end
    let!(:products) { create_list(:product, 10) }
    let!(:taxonomies) { create_list(:taxonomy, 10) }
    let!(:taxon) do
      taxonomy = taxonomies.first
      taxon = create :taxon,
                     name: 'Test taxon',
                     taxonomy: taxonomy,
                     products: [products.first]
      taxonomy.reload
      taxon
    end
    let(:ctx) { { current_store: current_store } }
    let(:variables) {}

    describe 'collectionByHandle' do
      let(:variables) { { collection_handle: taxon.permalink } }
      let(:query) do
        %q{
          query($collection_handle: String!) {
            shop {
              collectionByHandle(handle: $collection_handle) {
                id
              }
            }
          }
        }
      end
      let(:result) do
        {
          data: {
            shop: {
              collectionByHandle: {
                id: ::Spree::GraphQL::Schema.id_from_object(taxon)
              }
            }
          }
        }
      end

      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    describe 'collections' do
      let(:query) do
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
      end
      let(:result) do
        {
          data: {
            shop: {
              collections: {
                edges: [{
                  node: {
                    id: ::Spree::GraphQL::Schema.id_from_object(taxonomies.first),
                    title: taxonomies.first.name
                  }
                }],
                pageInfo: {
                  hasNextPage: true,
                  hasPreviousPage: false
                }
              }
            }
          }
        }
      end

      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end

      describe 'reverse' do
        let(:query) do
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
        end
        let(:result) do
          {
            data: {
              shop: {
                collections: {
                  edges: [{
                    node: {
                      id: ::Spree::GraphQL::Schema.id_from_object(taxonomies.last),
                      title: taxonomies.last.name
                    }
                  }],
                  pageInfo: {
                    hasNextPage: true,
                    hasPreviousPage: false
                  }
                }
              }
            }
          }
        end

        it 'succeeds' do
          execute
          expect(response_hash).to eq(result_hash)
        end
      end

      describe 'sortKey' do
        describe 'updatedAt' do
          let(:query) do
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
          end
          let(:result) do
            {
              data: {
                shop: {
                  collections: {
                    edges: [{
                      node: {
                        updatedAt: taxonomies.max_by(&:updated_at).updated_at.iso8601
                      }
                    }],
                    pageInfo: {
                      hasNextPage: false,
                      hasPreviousPage: true
                    }
                  }
                }
              }
            }
          end

          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end

        describe 'title' do
          let(:query) do
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
          end
          let(:result) do
            {
              data: {
                shop: {
                  collections: {
                    edges: [{
                      node: {
                        title: taxonomies.min_by(&:name).name
                      }
                    }],
                    pageInfo: {
                      hasNextPage: true,
                      hasPreviousPage: false
                    }
                  }
                }
              }
            }
          end

          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end

        describe 'id' do
          let(:query) do
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
          end
          let(:result) do
            {
              data: {
                shop: {
                  collections: {
                    edges: [{
                      node: {
                        id: ::Spree::GraphQL::Schema.id_from_object(taxonomies.max_by(&:id))
                      }
                    }],
                    pageInfo: {
                      hasNextPage: true,
                      hasPreviousPage: false
                    }
                  }
                }
              }
            }
          end

          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end
      end
    end

    describe 'description' do
      let(:description) { 'Sample Store Description' }
      let(:query) do
        %q{
          query {
            shop {
              description
            }
          }
        }
      end
      let(:result) do
        {
          data: {
            shop: {
              description: description
            }
          }
        }
      end

      it 'succeeds' do
        ctx[:current_store].meta_description = description
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    describe 'moneyFormat' do
      let(:query) do
        %q{
          query {
            shop {
              moneyFormat
            }
          }
        }
      end
      let(:result) do
        {
          data: {
            shop: {
              moneyFormat: '${{amount}}'
            }
          }
        }
      end

      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    describe 'name' do
      let(:query) do
        %q{
          query {
            shop {
              name
            }
          }
        }
      end
      let(:result) do
        {
          data: {
            shop: {
              name: shop.name
            }
          }
        }
      end

      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    describe 'paymentSettings' do
      let(:query) do
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
      end
      let(:result) do
        {
          data: {
            shop: {
              paymentSettings: {
                # acceptedCardBrands: 'VISA | MASTERCARD | DISCOVER | AMERICAN_EXPRESS | DINERS_CLUB | JCB',
                # cardVaultUrl: 'URL',
                countryCode: 'US',
                currencyCode: 'USD'
                # solidusPaymentsAccountId: 'String',
                # supportedDigitalWallets: 'APPLE_PAY | ANDROID_PAY | GOOGLE_PAY | SOLIDUS_PAY',
              }
            }
          }
        }
      end

      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    describe 'primaryDomain' do
      let(:query) do
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
      end
      let(:result) do
        {
          data: {
            shop: {
              primaryDomain: {
                host: ctx[:current_store].url,
                sslEnabled: false,
                url: "http://#{ctx[:current_store].url}"
              }
            }
          }
        }
      end

      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    describe 'productByHandle' do
      let(:variables) { { product_handle: products.first.slug } }
      let(:query) do
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
      end
      let(:result) do
        {
          data: {
            shop: {
              productByHandle: {
                id: ::Spree::GraphQL::Schema.id_from_object(products.first),
                title: products.first.name
              }
            }
          }
        }
      end

      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    describe 'products' do
      let(:query) do
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
      end
      let(:result) do
        {
          data: {
            shop: {
              products: {
                edges: [{
                  node: {
                    id: ::Spree::GraphQL::Schema.id_from_object(products.first),
                    handle: products.first.slug
                  }
                }],
                pageInfo: {
                  hasNextPage: true,
                  hasPreviousPage: false
                }
              }
            }
          }
        }
      end

      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end

      describe 'reverse' do
        let(:query) do
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
        end
        let(:result) do
          {
            data: {
              shop: {
                products: {
                  edges: [{
                    node: {
                      id: ::Spree::GraphQL::Schema.id_from_object(products.last),
                      handle: products.last.slug
                    }
                  }],
                  pageInfo: {
                    hasNextPage: true,
                    hasPreviousPage: false
                  }
                }
              }
            }
          }
        end

        it 'succeeds' do
          execute
          expect(response_hash).to eq(result_hash)
        end
      end

      describe 'sortKey' do
        describe 'createdAt' do
          let(:query) do
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
          end
          let(:result) do
            {
              data: {
                shop: {
                  products: {
                    edges: [{
                      node: {
                        createdAt: products.max_by(&:created_at).created_at.iso8601
                      }
                    }],
                    pageInfo: {
                      hasNextPage: false,
                      hasPreviousPage: true
                    }
                  }
                }
              }
            }
          end

          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end

        describe 'updatedAt' do
          let(:query) do
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
          end
          let(:result) do
            {
              data: {
                shop: {
                  products: {
                    edges: [{
                      node: {
                        updatedAt: products.max_by(&:updated_at).updated_at.iso8601
                      }
                    }],
                    pageInfo: {
                      hasNextPage: false,
                      hasPreviousPage: true
                    }
                  }
                }
              }
            }
          end

          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end

        describe 'title' do
          let(:query) do
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
          end
          let(:result) do
            {
              data: {
                shop: {
                  products: {
                    edges: [{
                      node: {
                        title: products.min_by(&:name).name
                      }
                    }],
                    pageInfo: {
                      hasNextPage: true,
                      hasPreviousPage: false
                    }
                  }
                }
              }
            }
          end

          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end

        describe 'id' do
          let(:query) do
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
          end
          let(:result) do
            {
              data: {
                shop: {
                  products: {
                    edges: [{
                      node: {
                        id: ::Spree::GraphQL::Schema.id_from_object(products.max_by(&:id))
                      }
                    }],
                    pageInfo: {
                      hasNextPage: true,
                      hasPreviousPage: false
                    }
                  }
                }
              }
            }
          end

          it 'succeeds' do
            execute
            expect(response_hash).to eq(result_hash)
          end
        end
      end
    end

    describe 'shipsToCountries' do
      let(:available_countries_isos) { %w[IT US] }
      let(:available_countries) { instance_double('available_countries', map: available_countries_isos) }
      let(:ctx) do
        {
          current_store: current_store,
          helpers: instance_double('helpers')
        }
      end
      let(:query) do
        %q{
          query {
            shop {
              shipsToCountries
            }
          }
        }
      end
      let(:result) do
        {
          data: {
            shop: {
              shipsToCountries: available_countries_isos
            }
          }
        }
      end

      it 'succeeds' do
        expect(ctx[:helpers]).to receive(:available_countries).once.with(no_args).and_return(available_countries)
        execute
        expect(response_hash).to eq(result_hash)
      end
    end
  end
end
