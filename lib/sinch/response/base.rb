require 'active_support/core_ext/module'

module Sinch
  module Response
    # Base Sinch API Response
    class Base
      attr_accessor :response

      delegate :success?, :body, :code, to: :response

      def json
        return {} unless success?
        response.parsed_response.to_json
      end
    end
  end
end
