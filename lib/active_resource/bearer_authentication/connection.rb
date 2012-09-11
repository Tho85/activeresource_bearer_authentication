require 'active_support/concern'

module ActiveResource
  module BearerAuthentication
    module Connection
      extend ActiveSupport::Concern

      included do
        alias authorization_header_without_bearer authorization_header

        def authorization_header(http_method, uri)
          if @password && auth_type == :bearer
            token = @password.is_a?(Proc) ? @password.call : @password
            { 'Authorization' => "Bearer #{token}" }
          else
            authorization_header_without_bearer(http_method, uri)
          end
        end

        def legitimize_auth_type(auth_type)
          [:basic, :digest, :bearer].include?(auth_type) ? auth_type : :basic
        end
      end
    end
  end
end
