# coding: utf-8
require 'omniauth'

module OmniAuth
  module Strategies
    class HttpsX509
      include OmniAuth::Strategy

      option :remote_user, nil

      uid do
        # With use ENV in development environment for emulating Apache StdEnv
        ### TODO find a way for emulating SetEnv in Webrick
        options.remote_user ? options.remote_user : ENV['REMOTE_USER']
      end

      info do
        ### XXX we don't yet retrieve the information
        {name: 'My Name'}
      end

      def request_phase
        # Authentication has already been done hence we directly redirect to callback phase
        redirect callback_path
      end

      def callback_phase
        # Authentication failure cannot be treated in the application. Here we just need to retrieve the
        # SSL environment variable
        super
      end
    end
  end
end

