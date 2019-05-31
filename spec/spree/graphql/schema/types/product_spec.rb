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
                  availableOn
                  createdAt
                  description
                  masterVariant {
                    id
                  }
                  name
                  slug
                  updatedAt
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
                    availableOn: product.available_on.iso8601,
                    createdAt: product.created_at.iso8601,
                    description: product.description,
                    masterVariant: {
                      id: ::Spree::GraphQL::Schema.id_from_object(product.master)
                    },
                    name: product.name,
                    slug: product.slug,
                    updatedAt: product.updated_at.iso8601
                  }
                },
                {
                  node: {
                    availableOn: product2.available_on.iso8601,
                    createdAt: product2.created_at.iso8601,
                    description: product2.description,
                    masterVariant: {
                      id: ::Spree::GraphQL::Schema.id_from_object(product2.master)
                    },
                    name: product2.name,
                    slug: product2.slug,
                    updatedAt: product2.updated_at.iso8601
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
