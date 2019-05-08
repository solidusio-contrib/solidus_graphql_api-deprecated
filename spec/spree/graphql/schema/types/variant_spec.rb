# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::GraphQL::Schema::Types::Variant do
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
  let(:ctx) { { current_store: current_store } }
  let(:variables) {}

  before { create(:store) }

  describe 'fields' do
    let(:query) do
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
    let(:result) do
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
      }
    end

    it 'succeeds' do
      execute
      expect(response_hash).to eq(result_hash)
    end
  end
end
