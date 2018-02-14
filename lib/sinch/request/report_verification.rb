require_relative './base'

module Sinch
  module Request
    # Report on Verification Request [PUT] /verifications/{type}/{endpoint}
    class ReportVerification < Base
      def method
        :put
      end

      def payload
        @payload ||= Builder::Request::ReportVerification.new(params).build
      end

      def endpoint
        "/verification/v1/verifications/number/#{params[:phone_number]}"
      end
    end
  end
end
