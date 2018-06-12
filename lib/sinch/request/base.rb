module Sinch
  module Request
    # Base Sinch Api Request
    class Base
      include Authorization

      attr_reader :params

      def initialize(params)
        @params = params
      end

      def method
        raise NotImplementedError,
              "#{self.class.name} must implement a `method` method"
      end

      def payload
        raise NotImplementedError,
              "#{self.class.name} must implement a `payload` method"
      end

      def headers
        {
          'content-type' => content_type,
          'x-timestamp' => timestamp,
          'authorization' => authorization
        }
      end

      def endpoint
        raise NotImplementedError,
              "#{self.class.name} must implement an `endpoint` method"
      end

      def url
        [base_url, endpoint].join
      end

      private

        def base_url
          'https://verificationapi-v1.sinch.com'
        end

        def public_resource?
          true
        end
    end
  end
end
