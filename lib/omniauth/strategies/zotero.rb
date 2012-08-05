require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Zotero < OmniAuth::Strategies::OAuth
      option :name, 'zotero'

      option :client_options, {
        :site => 'https://www.zotero.org',
        :request_token_path => '/oauth/request',
        :access_token_path => '/oauth/access',
        :authorize_path => '/oauth/authorize',
        :scheme => :query_string
      }

      uid do
        raw_info['userID'].to_i
      end

      info do
        {
          'name' => raw_info['username']
        }
      end

      credentials do
        {
          'token' => raw_info['oauth_token'],
          'secret' => raw_info['oauth_token_secret']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      private

      def raw_info
        access_token.params
      end

      def callback_phase
        session['oauth'][name.to_s]['callback_confirmed'] = true
        super
      end
    end
  end
end
