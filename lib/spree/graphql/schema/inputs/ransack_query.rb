# frozen_string_literal: true

class Spree::GraphQL::Schema::Inputs::RansackQuery < Spree::GraphQL::Schema::Inputs::BaseInput
  description <<~MD.chomp
    Query command matching the
    [Ransack](https://github.com/activerecord-hackery/ransack#search-matchers) syntax.

    ### Examples

    ```graphql
    query productsList($query: [RansackQuery!]) {
      products(query: $query) {
        nodes {
          id
        }
      }
    }

    # Sort by ID, in descending order
    {
      "query": [
        {
          "key": "s",
          "value": "id desc"
        }
      ]
    }

    # Match products whose name contains "t-shirt"
    # or whose any variants’ SKU is equal to "00016"
    {
      "query": [
        {
          "key": "name_cont",
          "value": "t-shirt"
        },
        {
          "key": "variants_including_master_sku_eq",
          "value": "ROR-00016"
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

  def self.queries_to_ransack_query(queries)
    queries.reduce({}) { |memo, query| memo.update query.to_ransack_query }
  end

  def to_ransack_query
    { key => value }
  end
end
