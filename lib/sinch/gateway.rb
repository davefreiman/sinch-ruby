require 'httparty'

module Sinch
  # Sinch Api Gateway
  class Gateway
    class << self
      def request(endpoint, params)
        request =
          "Sinch::Request::#{endpoint.to_s.classify}".constantize.new params
        response = "Sinch::Response::#{endpoint.to_s.classify}".constantize.new
        new(request, response, params).do_request
      end
    end

    def initialize(request, response, params)
      @request = request
      @response = response
      @params = params
    end

    def do_request
      begin
        response.response = ::HTTParty.send(
          method,
          url,
          headers: headers, body: payload.to_json
        )
      rescue ::HTTParty::ResponseError => e
        response.error = e
      end

      response
    end

    private

      delegate :headers, :payload, :method, :url, to: :request

      attr_reader :request, :response, :params
  end
end
