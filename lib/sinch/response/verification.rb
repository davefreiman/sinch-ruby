require_relative './base'

module Sinch
  module Response
    # Sinch API Response For Verification Request
    class Verification < Base
      def json
        return {} unless success?

        response_hash = response.parsed_response
        response_hash.merge('request_id' => response_hash['id'])
      end
    end
  end
end
