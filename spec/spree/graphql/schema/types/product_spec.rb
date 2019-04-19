# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::GraphQL::Schema::Types::Product do
  let!(:product) do
    p = create(:product)
    p.description = 'Product description'
    p.save!
    p
  end
  let!(:product2) do
    p = create(:product)
    p.description = nil
    p.save!
    p
  end
  let(:ctx) do
    { current_store: current_store }
  end
  let(:variables) {}

  before { create(:store) }

  describe 'fields' do
    let(:query) do
      %q{
        query {
          shop {
            products(first: 2) {
              edges {
                node {
                  createdAt
                  updatedAt
                  availableOn
                  description
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
            products: {
              edges: [
                {
                  node: {
                    createdAt: product.created_at.iso8601,
                    availableOn: product.available_on.iso8601,
                    updatedAt: product.updated_at.iso8601,
                    description: product.description,
                    name: product.name,
                    slug: product.slug
                  }
                },
                {
                  node: {
                    createdAt: product2.created_at.iso8601,
                    availableOn: product2.available_on.iso8601,
                    updatedAt: product2.updated_at.iso8601,
                    description: product2.description,
                    name: product2.name,
                    slug: product2.slug
                  }
                }
              ]
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
end
