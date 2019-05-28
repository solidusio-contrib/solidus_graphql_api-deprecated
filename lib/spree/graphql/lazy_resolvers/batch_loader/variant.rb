# frozen_string_literal: true

class Spree::GraphQL::LazyResolvers::BatchLoader::Variant < Spree::GraphQL::LazyResolvers::Base
  def images(query:)
    query = Spree::GraphQL::Schema::Inputs::RansackQuery.queries_to_ransack_query(query)

    ::BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |variant_ids, loader|
      images_batch(variant_ids, query).each do |image|
        loader.call(image.viewable_id) { |memo| memo << image }
      end
    end
  end

  def option_values
    ::BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |variant_ids, loader|
      option_values_batch(variant_ids).each do |option_values_variant|
        loader.call(option_values_variant.variant_id) { |memo| memo << option_values_variant.option_value }
      end
    end
  end

  def price
    pricing_options = context[:helpers].current_pricing_options

    ::BatchLoader::GraphQL.for(object.id).batch(default_value: nil) do |variant_ids, loader|
      price_batch(variant_ids).each do |price|
        loader.call(price.variant_id) do |memo|
          return memo if memo

          price.try! :money if current_price?(price, pricing_options)
        end
      end
    end
  end

  def prices
    ::BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |variant_ids, loader|
      prices_batch(variant_ids).each do |price|
        loader.call(price.variant_id) { |memo| memo << price.money }
      end
    end
  end

  def product
    ::BatchLoader::GraphQL.for(object.product_id).batch do |product_ids, loader|
      product_batch(product_ids).each { |product| loader.call(product.id, product) }
    end
  end

  private

  def images_batch(variant_ids, query)
    Spree::Image.where(viewable_type: object.class.to_s, viewable_id: variant_ids).ransack(query).result
  end

  def option_values_batch(variant_ids)
    Spree::OptionValuesVariant
      .includes(:variant, :option_value)
      .references(:option_value)
      .where(variant_id: variant_ids)
      .order(Spree::OptionValue.arel_table[:position].asc)
  end

  def price_batch(variant_ids)
    prices_batch(variant_ids)
  end

  def prices_batch(variant_ids)
    Spree::Price.currently_valid.where(variant_id: variant_ids)
  end

  def product_batch(product_ids)
    Spree::Product.where(id: product_ids)
  end

  def current_price?(price, pricing_options)
    (price.country_iso == pricing_options.desired_attributes[:country_iso] || price.country_iso.nil?) &&
      price.currency == pricing_options.desired_attributes[:currency]
  end
end
