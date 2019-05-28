# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::OptionValue < Spree::GraphQL::Schema::Types::BaseObjectNode
  include Spree::GraphQL::LazyResolver::TypeHelper

  graphql_name 'OptionValue'

  description <<~MD
    An OptionValue represents every single value an OptionType can assume. For instance, if there is a "Size"
    OptionType, then the OptionValues for it could be like "Small", "Medium", and "Large".
  MD

  field :name, ::GraphQL::Types::String, null: false do
    description 'The option value’s name.'
  end
  def name
    object.name
  end

  field :option_type, ::Spree::GraphQL::Schema::Types::OptionType, null: false do
    description 'The option value’s option type.'
  end
  delegate :option_type, to: :lazy_resolver

  field :presentation, ::GraphQL::Types::String, null: false do
    description 'The option value’s presentation.'
  end
  def presentation
    object.presentation
  end
end
