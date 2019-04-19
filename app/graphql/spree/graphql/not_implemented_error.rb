# frozen_string_literal: true

class Spree::GraphQL::NotImplementedError < ::GraphQL::ExecutionError
  def initialize
    super 'Not implemented yet'
  end
end
