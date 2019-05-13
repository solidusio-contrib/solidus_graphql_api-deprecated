# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::GraphQL::Schema::Types::Variant do
  let(:option_values) { create_list(:option_value, 2) }
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
    v.option_values = option_values
    v.save
    v
  end
  let(:ctx) {}
  let(:variables) {}

  describe 'fields' do
    let(:query) do
      %{
        query {
          productBySlug(slug: #{product.slug.to_json}) {
            id
            variants {
              nodes {
                id
                sku
                title
                weight
                optionValues {
                  nodes {
                    id
                  }
                }
                product {
                  id
                }
              }
            }
          }
        }
      }
    end
    let(:expected_option_values) do
      option_values
        .sort_by(&:position)
        .map { |option_value| { id: ::Spree::GraphQL::Schema.id_from_object(option_value) } }
    end
    let(:result) do
      {
        data: {
          productBySlug: {
            id: ::Spree::GraphQL::Schema.id_from_object(product),
            variants: {
              nodes: [{
                id: ::Spree::GraphQL::Schema.id_from_object(variant),
                sku: variant.sku,
                title: variant.name,
                weight: variant.weight,
                optionValues: {
                  nodes: expected_option_values
                },
                product: {
                  id: ::Spree::GraphQL::Schema.id_from_object(product)
                }
              }]
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
