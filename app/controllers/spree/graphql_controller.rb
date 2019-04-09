# frozen_string_literal: true

module Spree
  class GraphQLController < Spree::Api::BaseController
    skip_before_action :verify_authenticity_token

    # Shut off authentication for now
    def requires_authentication?
      # Spree::Api::Config[:requires_authentication]
      false
    end

    def execute
      variables = ensure_hash(params[:variables])
      query = params[:query]
      operation_name = params[:operationName]
      context = {
        current_spree_user: current_spree_user,
        current_store: current_store,
        helpers: helpers
      }
      result = Spree::GraphQL::Schema::Schema.execute(query, variables: variables, context: context, operation_name: operation_name)
      render json: result
    rescue StandardError => exception
      raise exception unless Rails.env.development?

      handle_error_in_development exception
    end

    private

    # Handle form data, JSON body, or a blank value
    def ensure_hash(ambiguous_param)
      case ambiguous_param
      when String
        if ambiguous_param.present?
          ensure_hash(JSON.parse(ambiguous_param))
        else
          {}
        end
      when Hash, ActionController::Parameters
        ambiguous_param
      when nil
        {}
      else
        raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
      end
    end

    def handle_error_in_development(exception)
      logger.error exception.message
      logger.error exception.backtrace.join("\n")

      render json: { error: { message: exception.message, backtrace: exception.backtrace }, data: {} }, status: 500
    end
  end
end
