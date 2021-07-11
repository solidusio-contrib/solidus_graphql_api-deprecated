# frozen_string_literal: true

module SolidusGraphqlApi::ProductDecorator
  module ClassMethods
    def ransackable_scopes(_auth_object = nil)
      (super || []) | %i[available]
    end
  end

  def self.prepended(base)
    class << base
      prepend ClassMethods
    end
  end

  Spree::Product.prepend self
end
