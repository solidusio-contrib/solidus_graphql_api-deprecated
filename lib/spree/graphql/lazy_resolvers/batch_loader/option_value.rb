# frozen_string_literal: true

class Spree::GraphQL::LazyResolvers::BatchLoader::OptionValue < Spree::GraphQL::LazyResolvers::Base
  def option_type
    ::BatchLoader::GraphQL.for(object.option_type_id).batch do |option_type_ids, loader|
      option_type_batch(option_type_ids).each { |option_type| loader.call(option_type.id, option_type) }
    end
  end

  private

  def option_type_batch(option_type_ids)
    Spree::OptionType.where(id: option_type_ids)
  end
end
