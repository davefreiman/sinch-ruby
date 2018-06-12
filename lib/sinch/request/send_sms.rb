require_relative './base'

module Sinch
  module Request
    # SMS Send Request [POST] /Sms/
    class SendSms < Base
      def method
        :post
      end

      def payload
        @payload ||= Builder::Request::SendSms.new(params).build
      end

      def endpoint
        "/v1/Sms/#{params[:phone_number]}"
      end

      private

        def public_resource?
          false
        end

        def base_url
          'https://messagingapi.sinch.com'
        end
    end
  end
end
