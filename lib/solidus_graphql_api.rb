# frozen_string_literal: true

require 'graphql'
require 'solidus_core'
require 'zeitwerk'

module SolidusGraphqlApi; end

require 'solidus_graphql_api/zeitwerk_inflector'

loader = Zeitwerk::Loader.for_gem
loader.inflector = SolidusGraphqlApi::ZeitwerkInflector.new __FILE__
loader.ignore "#{__dir__}/solidus_graphql_api/zeitwerk_inflector.rb"
loader.setup
loader.eager_load
