# frozen_string_literal: true

module Spree::GraphQL::LazyResolver::TypeHelper
  protected

  def lazy_resolver
    Spree::GraphQL::LazyResolvers.for(self.class).new(object, context)
  end
end
