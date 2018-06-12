module Sinch
  module Request
    module Authorization
      private

        def authorization
          @auth ||= begin
            return public_resource_auth if public_resource?
            protected_resource_auth
          end
        end

        def public_resource_auth
          "Application #{application_key}"
        end

        def protected_resource_auth
          return unless application_secret.present?
          'Application ' + [
            application_key,
            signature
          ].join(':')
        end

        def signature
          Base64.encode64(
            OpenSSL::HMAC.digest(
              OpenSSL::Digest.new('sha256'),
              Base64.decode64(application_secret),
              string_to_sign
            )
          ).strip
        end

        def string_to_sign
          [
            method.to_s.upcase,
            content_md5,
            content_type,
            canonical_headers,
            endpoint
          ].join("\n").encode('UTF-8')
        end

        def content_md5
          Base64.encode64(
            Digest::MD5.digest(payload.to_json.encode('UTF-8'))
          ).strip
        end

        def canonical_headers
          "x-timestamp:#{timestamp}"
        end

        def content_type
          'application/json'
        end

        def timestamp
          Time.now.utc.iso8601
        end

        def application_key
          Sinch.config.application_key
        end

        def application_secret
          Sinch.config.secret_key
        end
    end
  end
end
