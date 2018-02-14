require_relative './base'

module Sinch
  module Builder
    module Request
      # Verification Request Builder
      class Verification < Base
        def build
          {
            identity: {
              type: 'number',
              endpoint: phone_number
            },
            method: 'sms'
          }
        end

        private

          def phone_number
            params[:phone_number]
          end
      end
    end
  end
end
