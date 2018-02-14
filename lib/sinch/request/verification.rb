require_relative './base'

module Sinch
  module Request
    # Verification Request [POST] /verifications/
    class Verification < Base
      def method
        :post
      end

      def payload
        @payload ||= Builder::Request::Verification.new(params).build
      end

      def endpoint
        '/verification/v1/verifications'
      end
    end
  end
end
