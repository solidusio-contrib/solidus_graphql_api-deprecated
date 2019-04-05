# frozen_string_literal: true

require 'carmen'
module Spree::GraphQL::Helpers
  module BaseHelper
    include ::ActionView::Helpers::TextHelper

    # TODO this is an excerpt from Solidus' helper BaseHelper.
    # It should be required and used directly, instead of this file.
    def available_countries(restrict_to_zone: ::Spree::Config[:checkout_zone])
      checkout_zone = ::Spree::Zone.find_by(name: restrict_to_zone)

      if checkout_zone && checkout_zone.kind == 'country'
        countries = checkout_zone.country_list
      else
        countries = ::Spree::Country.all
      end

      country_names = ::Carmen::Country.all.map do |country|
        [country.code, country.name]
      end.to_h

      country_names.update ::I18n.t('spree.country_names', default: {}).stringify_keys

      countries.collect do |country|
        country.name = country_names.fetch(country.iso, country.name)
        country
      end.sort_by { |c| c.name.parameterize }
    end
  end
end
