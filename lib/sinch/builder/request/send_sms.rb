require_relative './base'

module Sinch
  module Builder
    module Request
      # Sms Request Builder
      class SendSms < Base
        def build
          {
            from: params[:from],
            message: params[:message]
          }
        end
      end
    end
  end
end
