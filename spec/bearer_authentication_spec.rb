require 'spec_helper'

describe 'bearer authentication' do
  context 'bearer' do
    before(:each) do
      class MyResource < ActiveResource::Base
        self.auth_type = :bearer

        self.site = 'http://spec.invalid/'
      end
    end

    it 'sets bearer token' do
      MyResource.token = 'spoken'

      MyResource.connection.send(:authorization_header, :get, '/my_uri').should == { 'Authorization' => 'Bearer spoken' }
      MyResource.token.should == 'spoken'
    end

    it 'sets bearer token lazily' do
      MyResource.token do
        "JRR_Token"
      end

      MyResource.connection.send(:authorization_header, :get, '/my_uri').should == { 'Authorization' => 'Bearer JRR_Token' }
      MyResource.token.should == 'JRR_Token'
    end
  end

  context 'passthrough' do
    before(:each) do
      class MyPassthroughResource < ActiveResource::Base
        self.auth_type = :basic

        self.site = 'http://user:pass@spec.invalid'
      end
    end

    it 'still accepts other auths' do
      MyPassthroughResource.connection.should_receive(:authorization_header_without_bearer).with(:get, '/my_uri')

      MyPassthroughResource.connection.send(:authorization_header, :get, '/my_uri')
    end
  end
end

