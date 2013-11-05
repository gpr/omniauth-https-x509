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
        # To avoid certificate encoding issue we force the encoding to UTF-8
        options.remote_user ? options.remote_user.force_encoding('UTF-8') : ENV['REMOTE_USER']
      end

      info do
        @info
      end

      def request_phase
        # Authentication has already been done hence we directly redirect to callback phase
        redirect callback_path
      end

      def callback_phase
        # Authentication failure cannot be treated in the application. Here we just need to retrieve the
        # SSL environment variables.
        # To avoid certificate encoding issue we force the encoding to UTF-8
        @info = {name: request.env['SSL_CLIENT_S_DN_CN'].force_encoding('UTF-8'),
                 email:  request.env['SSL_CLIENT_S_DN_Email'].force_encoding('UTF-8')}
        super
      end
    end
  end
end

