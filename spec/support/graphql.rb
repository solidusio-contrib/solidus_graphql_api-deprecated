# frozen_string_literal: true

module Spree::GraphQL::Spec
  module Helpers
    def current_store
      ::Spree::Store.where(default: true).first
    end

    # Parameters accepted are GraphQL's Query#initialize:
    # (query_string||query()), context, variables, operation_name, root_value, max_depth, max_complexity, except, only
    def execute(action = nil, params = {})
      unless action
        raise(Exception, 'Must pass a query to run as argument or define let!(:query) { ... }') unless respond_to?(:query)

        action = query
      end

      params[:context] ||= ctx
      params[:variables] ||= variables

      @response = ::Spree::GraphQL::Schema::Schema.execute(action, params)
    end

    def response
      @response
    end

    def response_json(query_response = response)
      query_response.to_json
    end

    def response_hash(query_response = response)
      JSON.parse(query_response.to_json).with_indifferent_access
    end

    def result_json(query_result = result)
      query_result.is_a?(Hash) ? query_result.to_json : query_result
    end

    def result_hash(query_result = result)
      (query_result.is_a?(Hash) ? query_result : JSON.parse(query_result.to_json)).with_indifferent_access
    end
  end
end
