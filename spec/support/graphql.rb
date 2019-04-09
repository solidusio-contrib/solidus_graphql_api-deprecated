# frozen_string_literal: true

module Spree::GraphQL::Spec
  module Helpers
    def current_store
      ::Spree::Store.where(default: true).first
    end

    def execute(action = nil, params = {})
      # Parameters accepted are GraphQL's Query#initialize:
      # (query_string||query()), context, variables, operation_name, root_value, max_depth, max_complexity, except, only
      action ||= self.respond_to?(:query) ? query : raise(Exception.new('Must pass a query to run as argument or define let!(:query) { ... }'))
      params[:context] ||= ctx
      params[:variables] ||= variables
      @response = ::Spree::GraphQL::Schema::Schema.execute(action, params)
    end

    def response
      @response
    end
    def response_json(r = response)
      r.to_json
    end
    def response_hash(r = response)
			JSON.parse(r.to_json).with_indifferent_access
    end

    def result_json(r = result)
      r.is_a?(Hash) ? r.to_json : r
    end
    def result_hash(r = result)
      ( r.is_a?(Hash) ? r : JSON.parse(r.to_json)).with_indifferent_access
    end

  end
end
