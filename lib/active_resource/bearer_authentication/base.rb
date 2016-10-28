require 'active_support/concern'

module ActiveResource
  module BearerAuthentication
    module Base
      extend ActiveSupport::Concern

      module ClassMethods
        def token=(value)
          self.password = value
        end

        def token(&block)
          if block_given?
            self.password = block
          else
            self.password.is_a?(Proc) ? self.password.call : self.password
          end
        end
      end

    end
  end
end
