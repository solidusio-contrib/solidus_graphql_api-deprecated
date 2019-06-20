# frozen_string_literal: true

module SolidusGraphqlApi::ImageDecorator
  def self.prepended(base)
    base.whitelisted_ransackable_attributes = (base.whitelisted_ransackable_attributes || []) | %w[position]
  end

  Spree::Image.prepend self
end
