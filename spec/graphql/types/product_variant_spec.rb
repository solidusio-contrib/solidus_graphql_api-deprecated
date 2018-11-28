# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::ProductVariant' do
    let!(:shop) { create(:store) }
    let!(:product) {
      p = create(:product)
      p.slug = 'product'
      p.save
      p
    }
    let!(:variant) {
      v = create(:variant)
      v.product = product
      v.weight = 5.84
      v.save
      v
    }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    describe 'fields' do
      let!(:query) {
        %q{
          query {
            shop {
              productByHandle(handle: "product") {
                id
                variants {
                  nodes {
                    id
                    sku
                    title
                    weight
                    product {
                      id
                    }
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
              productByHandle: {
                id: ::Spree::GraphQL::Schema::Schema.id_from_object(product),
                variants: {
                  nodes: [{
                    id: ::Spree::GraphQL::Schema::Schema.id_from_object(variant),
                    sku: variant.sku,
                    title: variant.name,
                    weight: variant.weight,
                    product: {
                      id: ::Spree::GraphQL::Schema::Schema.id_from_object(product),
                    }
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

    # availableForSale: Indicates if the product variant is available for sale.
    # @return [Types::Boolean!]
    describe 'availableForSale' do
      let!(:query) {
        %q{
          query {
            productVariant {
              availableForSale
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            productVariant: {
              availableForSale: 'Boolean',
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

    # compareAtPrice: The compare at price of the variant. This can be used to mark a variant as on sale, when `compareAtPrice` is higher than `price`.
    # @return [Types::Money]
    describe 'compareAtPrice' do
      let!(:query) {
        %q{
          query {
            productVariant {
              compareAtPrice
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            productVariant: {
              compareAtPrice: 'Money',
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

    # image: Image associated with the product variant. This field falls back to the product image if no image is available.
    # @param max_width [Types::Int]
    # @param max_height [Types::Int]
    # @param crop [Types::CropRegion]
    # @param scale [Types::Int] (1)
    # @return [Types::Image]
    describe 'image' do
      let!(:query) {
        %q{
          query {
            productVariant {
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
            productVariant: {
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

    # price: The product variant’s price.
    # @return [Types::Money!]
    describe 'price' do
      let!(:query) {
        %q{
          query {
            productVariant {
              price
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            productVariant: {
              price: 'Money',
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

    # selectedOptions: List of product options applied to the variant.
    # @return [[Types::SelectedOption!]!]
    describe 'selectedOptions' do
      let!(:query) {
        %q{
          query {
            productVariant {
              selectedOptions {
                name
                value
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            productVariant: {
              selectedOptions: [{
                name: 'String',
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

    # weightUnit: Unit of measurement for weight.
    # @return [Types::WeightUnit!]
    describe 'weightUnit' do
      let!(:query) {
        %q{
          query {
            productVariant {
              weightUnit
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            productVariant: {
              weightUnit: 'KILOGRAMS | GRAMS | POUNDS | OUNCES',
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
