# frozen_string_literal: true

require 'spec_helper'

module Spree::GraphQL
  describe 'Types::ProductVariant' do
    let!(:shop) { create(:store) }
    let!(:product) do
      p = create(:product)
      p.slug = 'product'
      p.save
      p
    end
    let!(:variant) do
      v = create(:variant)
      v.product = product
      v.weight = 5.84
      v.save
      v
    end
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) {}

    describe 'fields' do
      let!(:query) do
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
      end
      let!(:result) do
        {
          data: {
            shop: {
              productByHandle: {
                id: ::Spree::GraphQL::Schema.id_from_object(product),
                variants: {
                  nodes: [{
                    id: ::Spree::GraphQL::Schema.id_from_object(variant),
                    sku: variant.sku,
                    title: variant.name,
                    weight: variant.weight,
                    product: {
                      id: ::Spree::GraphQL::Schema.id_from_object(product)
                    }
                  }]
                }
              }
            }
          }
          # errors: {},
        }
      end
      it 'succeeds' do
        execute
        expect(response_hash).to eq(result_hash)
      end
    end

    # availableForSale: Indicates if the product variant is available for sale.
    # @return [Types::Boolean!]
    describe 'availableForSale' do
      let!(:query) do
        %q{
          query {
            productVariant {
              availableForSale
            }
          }
        }
      end
      let!(:result) do
        {
          data: {
            productVariant: {
              availableForSale: 'Boolean'
            }
          }
          # errors: {},
        }
      end
      # it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      # end
    end

    # compareAtPrice: The compare at price of the variant. This can be used to mark a variant as on sale, when `compareAtPrice` is higher than `price`.
    # @return [Types::Money]
    describe 'compareAtPrice' do
      let!(:query) do
        %q{
          query {
            productVariant {
              compareAtPrice
            }
          }
        }
      end
      let!(:result) do
        {
          data: {
            productVariant: {
              compareAtPrice: 'Money'
            }
          }
          # errors: {},
        }
      end
      # it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      # end
    end

    # image: Image associated with the product variant. This field falls back to the product image if no image is available.
    # @param max_width [Types::Int]
    # @param max_height [Types::Int]
    # @param crop [Types::CropRegion]
    # @param scale [Types::Int] (1)
    # @return [Types::Image]
    describe 'image' do
      let!(:query) do
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
      end
      let!(:result) do
        {
          data: {
            productVariant: {
              image: {
                altText: 'String',
                id: 'ID',
                originalSrc: 'URL',
                src: 'URL',
                transformedSrc: 'URL'
              }
            }
          }
          # errors: {},
        }
      end
      # it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      # end
    end

    # price: The product variant’s price.
    # @return [Types::Money!]
    describe 'price' do
      let!(:query) do
        %q{
          query {
            productVariant {
              price
            }
          }
        }
      end
      let!(:result) do
        {
          data: {
            productVariant: {
              price: 'Money'
            }
          }
          # errors: {},
        }
      end
      # it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      # end
    end

    # selectedOptions: List of product options applied to the variant.
    # @return [[Types::SelectedOption!]!]
    describe 'selectedOptions' do
      let!(:query) do
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
      end
      let!(:result) do
        {
          data: {
            productVariant: {
              selectedOptions: [{
                name: 'String',
                value: 'String'
              }]
            }
          }
          # errors: {},
        }
      end
      # it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      # end
    end

    # weightUnit: Unit of measurement for weight.
    # @return [Types::WeightUnit!]
    describe 'weightUnit' do
      let!(:query) do
        %q{
          query {
            productVariant {
              weightUnit
            }
          }
        }
      end
      let!(:result) do
        {
          data: {
            productVariant: {
              weightUnit: 'KILOGRAMS | GRAMS | POUNDS | OUNCES'
            }
          }
          # errors: {},
        }
      end
      # it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      # end
    end
  end
end
