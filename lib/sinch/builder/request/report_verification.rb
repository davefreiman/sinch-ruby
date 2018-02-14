require_relative './base'

module Sinch
  module Builder
    module Request
      # ReportVerification Request Builder
      class ReportVerification < Base
        def build
          {
            method: 'sms',
            sms: {
              code: params[:code]
            }
          }
        end
      end
    end
  end
end
