# frozen_string_literal: true

class Spree::GraphQL::LazyResolvers::BatchLoader::Product < Spree::GraphQL::LazyResolvers::Base
  def master_variant
    ::BatchLoader::GraphQL.for(object.id).batch do |product_ids, loader|
      master_variant_batch(product_ids).each { |variant| loader.call(variant.product_id, variant) }
    end
  end

  def variants(including_master:, query:)
    query = Spree::GraphQL::Schema::Inputs::RansackQuery.queries_to_ransack_query(query)

    ::BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |product_ids, loader|
      variants_batch(product_ids, query, including_master).each do |variant|
        loader.call(variant.product_id) { |memo| memo << variant }
      end
    end
  end

  private

  def master_variant_batch(product_ids)
    Spree::Variant.where(product_id: product_ids).where(is_master: true)
  end

  def variants_batch(product_ids, query, including_master)
    variants = Spree::Variant.where(product_id: product_ids).ransack(query).result
    variants = variants.where(is_master: false) unless including_master
    variants
  end
end
