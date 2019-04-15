# frozen_string_literal: true

class Spree::GraphQL::Schema::Inputs::SearchQuery < Spree::GraphQL::Schema::Inputs::BaseInput
  description <<~MD
    Query search command matching the
    [Ransack](https://github.com/activerecord-hackery/ransack#search-matchers) syntax.

    ### Examples

    ```graphql
    query productsList($searchQuery: [SearchQuery!]) {
      products(searchQuery: $searchQuery) {
        nodes {
          id
        }
      }
    }

    # Sort by ID, in descending order
    {
      "searchQuery": [
        {
          "key": "sort",
          "value": "id desc"
        }
      ]
    }

    # Match products whose name contains "t-shirt"
    # or whose any variants’ SKU is equal to "00016"
    {
      "searchQuery": [
        {
          "key": "name_matches",
          "value": "t-shirt"
        },
        {
          "key": "variants_including_master_sku_eq",
          "value": "00016"
        },
        {
          "key": "m",
          "value": "or"
        }
      ]
    }
    ```
  MD

  argument :key, ::GraphQL::Types::String, required: true
  argument :value, ::GraphQL::Types::String, required: true
end
