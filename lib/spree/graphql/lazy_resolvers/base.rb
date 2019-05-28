# frozen_string_literal: true

class Spree::GraphQL::LazyResolvers::Base
  attr_reader :object, :context

  def initialize(object, context)
    @object = object
    @context = context
  end
end
