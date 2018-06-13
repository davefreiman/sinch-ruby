module Sinch
  # Bogus Gateway for Sinch
  class BogusGateway
    # Stub the Response
    Response = Struct.new(:code, :success?, :json)

    class << self
      def request(endpoint, _params = {})
        new.send(endpoint)
      end
    end

    def verification
      Response.new(
        200,
        true,
        'request_id' => '323208e2-5e06-4f89-9109-febe2422e715',
        'sms' => {
          'template' => 'Your verification code is code',
          'interceptionTimeout' => 120
        },
        'method' => 'sms'
      )
    end

    def report_verification
      Response.new(
        200,
        true,
        'request_id' => '323208e2-5e06-4f89-9109-febe2422e715',
        'method' => 'sms',
        'status' => 'SUCCESSFUL'
      )
    end

    def send_sms
      Response.new(
        200,
        true,
        messageId: '166386921'
      )
    end
  end
end
