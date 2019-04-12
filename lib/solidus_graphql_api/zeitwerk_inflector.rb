# frozen_string_literal: true

class SolidusGraphqlApi::ZeitwerkInflector < Zeitwerk::GemInflector
  def camelize(basename, _abspath)
    case basename
    when 'graphql'
      'GraphQL'
    when 'url'
      'URL'
    else
      super
    end
  end
end
