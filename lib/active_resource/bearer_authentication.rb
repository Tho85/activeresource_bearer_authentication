require 'active_resource'

module ActiveResource
  module BearerAuthentication
    autoload :Base, 'active_resource/bearer_authentication/base'
    autoload :Connection, 'active_resource/bearer_authentication/connection'

    autoload :Version, 'active_resource/bearer_authentication/version'
  end
end

ActiveResource::Base.send :include, ActiveResource::BearerAuthentication::Base
ActiveResource::Connection.send :include, ActiveResource::BearerAuthentication::Connection
