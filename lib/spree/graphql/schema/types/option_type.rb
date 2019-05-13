# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::OptionType < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'OptionType'

  description <<~MD
    Option types denote the different options for a variant. A typical option type would be a size, with that option
    type’s values being something such as "Small", "Medium" and "Large". Another typical option type could be a color,
    such as "Red", "Green", or "Blue".
    A product can be assigned many option types, but must be assigned at least one if you wish to create variants for
    that product.
  MD

  field :name, ::GraphQL::Types::String, null: false do
    description 'The option type’s name.'
  end
  def name
    object.name
  end

  field :presentation, ::GraphQL::Types::String, null: false do
    description 'The option type’s presentation.'
  end
  def presentation
    object.presentation
  end
end
