# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Collection' do
    let!(:taxonomy) { create(:taxonomy) }
    let!(:collection) {
      t = ::Spree::Taxon.first
      t.description = 'A description of the collection'
      t.permalink = 'permalink/handle'
      t.name = 'Taxon Title'
      t.save
      t
    }
    let!(:shop) { create(:store) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # description: Stripped description of the collection, single line with HTML tags removed.
    # @param truncate_at [Types::Int]
    # @return [Types::String!]
    describe 'description' do
      let!(:query) {
        %q{
          query {
            shop {
              collections(first: 1) {
                edges {
                  node {
                    description
                  }
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
              collections: {
                edges: [{
                  node: {
                    description: collection.description,
                  }
                }]
              }
            }
          },
          #errors: {},
        }
      }
      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end

      context 'truncateAt' do
        let!(:query) {
          %q{
            query {
              shop { collections(first: 1) { edges { node {
                description(truncateAt: 5)
              } } } }
            }
          }
        }
        let!(:result) {
          {
            data: {
              shop: { collections: { edges: [{ node: {
                description: collection.description[0..1] + '...'
              } }] } }
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

    # descriptionHtml: The description of the collection, complete with HTML formatting.
    # @return [Types::HTML!]
    describe 'descriptionHtml' do
      let!(:query) {
        %q{
          query {
            collection {
              descriptionHtml
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            collection: {
              descriptionHtml: 'HTML',
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

    # handle: A human-friendly unique string for the collection automatically generated from its title. Limit of 255 characters.
    # @return [Types::String!]
    describe 'handle' do
      let!(:query) {
        %q{
          query {
            shop {
              collections(first: 1) {
                edges {
                  node {
                    handle
                  }
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
              collections: {
                edges: [{
                  node: {
                    handle: collection.permalink,
                  }
                }]
              }
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

    # id: Globally unique identifier.
    # @return [Types::ID!]
    describe 'id' do
      let!(:query) {
        %q{
          query {
            collection {
              id
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            collection: {
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

    # image: Image associated with the collection.
    # @param max_width [Types::Int]
    # @param max_height [Types::Int]
    # @param crop [Types::CropRegion]
    # @param scale [Types::Int] (1)
    # @return [Types::Image]
    describe 'image' do
      let!(:query) {
        %q{
          query {
            collection {
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
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            collection: {
              image: {
                altText: 'String',
                id: 'ID',
                originalSrc: 'URL',
                src: 'URL',
                transformedSrc: 'URL',
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

    # products: List of products in the collection.
    # @param reverse [Types::Boolean] (false)
    # @param sort_key [Types::ProductCollectionSortKeys] ('COLLECTION_DEFAULT')
    # @return [Types::Product.connection_type!]
    describe 'products' do
      let!(:query) {
        %q{
          query {
            collection {
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
                        # ...
                      }
                      price
                      product
                      selectedOptions {
                        # ...
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
                        # ...
                      }
                      pageInfo {
                        # ...
                      }
                    }
                    vendor
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
            collection: {
              products: {
                edges: {
                  node: [{
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
                    variantBySelectedOptions: {
                      available: 'Boolean',
                      availableForSale: 'Boolean',
                      compareAtPrice: 'Money',
                      id: 'ID',
                      image: {
                        # ...
                      },
                      price: 'Money',
                      product: 'Product...',
                      selectedOptions: {
                        # ...
                      },
                      sku: 'String',
                      title: 'String',
                      weight: 'Float',
                      weightUnit: 'KILOGRAMS | GRAMS | POUNDS | OUNCES',
                    },
                    variants: {
                      edges: {
                        # ...
                      },
                      pageInfo: {
                        # ...
                      },
                    },
                    vendor: 'String',
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

    # title: The collection’s name. Limit of 255 characters.
    # @return [Types::String!]
    describe 'title' do
      let!(:query) {
        %q{
          query {
            shop {
              collections(first: 1) {
                edges {
                  node {
                    title
                  }
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
              collections: {
                edges: [{
                  node: {
                    title: collection.name,
                  }
                }]
              }
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

    # updatedAt: The date and time when the collection was last modified.
    # @return [Types::DateTime!]
    describe 'updatedAt' do
      let!(:query) {
        %q{
          query {
            shop {
              collections(first: 1) {
                edges {
                  node {
                    updatedAt
                  }
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
              collections: {
                edges: [{
                  node: {
                    updatedAt: collection.updated_at.iso8601
                  }
                }]
              }
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
