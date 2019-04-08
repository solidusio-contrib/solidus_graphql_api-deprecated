# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Collection' do
    let(:collection_description) { '  Not stripped collection description  ' }
    let!(:shop) { create(:store) }
    let!(:taxonomy) { create(:taxonomy) }
    let!(:collection) {
      t = ::Spree::Taxon.first
      t.description = collection_description
      t.permalink = 'handle'
      t.name = 'Taxon Title'
      t.save
      t
    }
    let!(:product) {
      p = create(:product)
      p.name = 'B Product'
      p.description = 'Product description'
      p.slug = 'product1'
      p.taxons= [collection]
      p.save
    }
    let!(:product2) {
      p = create(:product)
      p.name = 'A Product'
      p.description = nil
      p.slug = 'product2'
      p.taxons= [collection]
      p.save
    }
    let!(:products) { collection.products }
    let!(:ctx) do
      {
        helpers: double(:helpers),
        current_store: current_store
      }
    end
    let!(:variables) { }

    describe 'fields' do
      let!(:query) {
        %q{
          query {
            shop {
              collectionByHandle(handle: "handle") {
                description
                handle
                id
                title
                updatedAt
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
                description: collection_description.strip,
                handle: collection.permalink,
                id: ::Spree::GraphQL::Schema::Schema::id_from_object(collection),
                title: collection.name,
                updatedAt: collection.updated_at.iso8601,
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
            shop {
              collectionByHandle(handle: "handle") {
                products(first: 2) {
                  nodes { handle id title }
                }
                reverse: products(first: 1, reverse: true) {
                  nodes { handle id title }
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
              collectionByHandle: {
                products: {
                  nodes: [{
                    id: ::Spree::GraphQL::Schema::Schema.id_from_object(products.first),
                    handle: products.first.slug,
                    title: products.first.name,
                    #descriptionHtml: products.first.description,
                  },
                  {
                    id: ::Spree::GraphQL::Schema::Schema.id_from_object(products.second),
                    handle: products.second.slug,
                    title: products.second.name,
                    #descriptionHtml: '',
                  }],
                },
                reverse: {
                  nodes: [{
                    id: ::Spree::GraphQL::Schema::Schema.id_from_object(products.last),
                    handle: products.last.slug,
                    title: products.last.name,
                  }],
                }
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

      context 'sortKey' do
        let!(:query) {
          %q{
            query {
              shop {
                collectionByHandle(handle: "handle") {
                  products(first: 1, sortKey: TITLE, reverse: false) {
                    nodes { handle id title }
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
                collectionByHandle: {
                  products: {
                    nodes: [{
                      id: ::Spree::GraphQL::Schema::Schema.id_from_object(products.last),
                      handle: products.last.slug,
                      title: products.last.name,
                    }],
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
end
