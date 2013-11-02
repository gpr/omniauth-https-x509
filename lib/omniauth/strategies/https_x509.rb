# coding: utf-8
require 'omniauth'
require 'net/http'

module OmniAuth
  module Strategies
    class HttpsX509
      include OmniAuth::Strategy

      args [:endpoint]

      option :title, "Https X509"
      option :headers, {}

      def request_phase
      end

      def callback_phase
        return fail!(:invalid_credentials) if !x509_response
        return fail!(:invalid_credentials) if x509_response.code.to_i >= 400
        super
      end

      protected

      # by default we use static uri. If dynamic uri is required, override
      # this method.
      def api_uri
        options.endpoint
      end

      def x509_response
        unless @x509_response
          uri = URI(api_uri)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
          req = Net::HTTP::Get.new(uri.request_uri)
          @x509_response = http.request(req)
        end
      end
    end
  end
end

