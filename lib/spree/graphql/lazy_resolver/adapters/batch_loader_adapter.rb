# frozen_string_literal: true

class Spree::GraphQL::LazyResolver::Adapters::BatchLoaderAdapter <
  Spree::GraphQL::LazyResolver::Adapters::AbstractAdapter
  def self.activate(schema)
    require_dependencies

    schema.use ::BatchLoader::GraphQL
  end

  def self.clear_cache
    ::BatchLoader::Executor.clear_current
  end

  def self.require_dependencies
    gem 'batch-loader', '~> 1.4.0'
  end

  def self.resolvers_namespace
    Spree::GraphQL::LazyResolvers::BatchLoader
  end
end
