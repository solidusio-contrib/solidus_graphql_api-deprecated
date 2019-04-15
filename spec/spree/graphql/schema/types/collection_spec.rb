# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::GraphQL::Schema::Types::Collection do
  let(:collection_description) { '  Not stripped collection description  ' }
  let!(:collection) do
    create :taxon,
           description: collection_description,
           permalink: 'handle',
           name: 'Taxon Title',
           products: [product, product2]
  end
  let(:product) do
    create :product,
           name: 'B Product',
           description: 'Product description',
           slug: 'product1'
  end
  let(:product2) do
    create :product,
           name: 'A Product',
           description: nil,
           slug: 'product2'
  end
  let(:products) { collection.products }
  let(:ctx) { { current_store: current_store } }
  let(:variables) {}

  before { create(:store) }

  describe 'fields' do
    let(:query) do
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
    end
    let(:result) do
      {
        data: {
          shop: {
            collectionByHandle: {
              description: collection_description.strip,
              handle: collection.permalink,
              id: ::Spree::GraphQL::Schema.id_from_object(collection),
              title: collection.name,
              updatedAt: collection.updated_at.iso8601
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
            collectionByHandle(handle: "handle") {
              products(first: 2) {
                nodes {
                  id
                  name
                  slug
                }
              }
              reverse: products(first: 1, reverse: true) {
                nodes {
                  id
                  name
                  slug
                }
              }
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
              products: {
                nodes: [
                  {
                    id: ::Spree::GraphQL::Schema.id_from_object(products.first),
                    name: products.first.name,
                    slug: products.first.slug
                  },
                  {
                    id: ::Spree::GraphQL::Schema.id_from_object(products.second),
                    name: products.second.name,
                    slug: products.second.slug
                  }
                ]
              },
              reverse: {
                nodes: [
                  {
                    id: ::Spree::GraphQL::Schema.id_from_object(products.last),
                    name: products.last.name,
                    slug: products.last.slug
                  }
                ]
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

    describe 'sortKey' do
      let(:query) do
        %q{
          query {
            shop {
              collectionByHandle(handle: "handle") {
                products(first: 1, sortKey: TITLE, reverse: false) {
                  nodes {
                    id
                    name
                    slug
                  }
                }
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
                products: {
                  nodes: [
                    {
                      id: ::Spree::GraphQL::Schema.id_from_object(products.last),
                      name: products.last.name,
                      slug: products.last.slug
                    }
                  ]
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
