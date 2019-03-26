module Spree
  module Graphql
    module JwtAuthentication
      extend ActiveSupport::Concern

      included do
        attr_reader :json_web_token

        before_action :load_json_web_token
        before_action :load_user
        before_action :check_api_key_validity
      end

      private

      def load_json_web_token
        @json_web_token = SolidusJwt.decode(api_key).first
      rescue JWT::DecodeError
      end

      def load_user
        user_id = json_web_token.try(:[], 'id')
        @current_graphql_user = Spree.user_class.find_by(id: user_id) if user_id
      end

      def check_api_key_validity
        if api_key && !current_graphql_user
          head :unauthorized
        end
      end

      def api_key
        bearer_token
      end

      def bearer_token
        pattern = /^Bearer /
        header = request.headers['Authorization']
        header.gsub(pattern, '') if header.present? && header.match(pattern)
      end
    end
  end
end
