module Sinch
  module Builder
    module Request
      # Base Builder for Sinch API request
      class Base
        attr_reader :params

        def initialize(params)
          @params = params
        end

        def build
          raise NotImplementedError,
                "#{self.class.name} must implement a `build` method"
        end
      end
    end
  end
end
