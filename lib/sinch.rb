require 'active_support'

# Sinch API Wrapper
module Sinch
  include ::ActiveSupport::Configurable
end

require 'sinch/builder/request/base'
require 'sinch/builder/request/verification'
require 'sinch/builder/request/report_verification'
require 'sinch/builder/request/send_sms'

require 'sinch/request/concerns/authorization'
require 'sinch/request/base'
require 'sinch/request/verification'
require 'sinch/request/report_verification'
require 'sinch/request/send_sms'

require 'sinch/response/base'
require 'sinch/response/verification'
require 'sinch/response/report_verification'
require 'sinch/response/send_sms'

require 'sinch/gateway'
require 'sinch/bogus_gateway'
