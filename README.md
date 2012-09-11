# ActiveResource::BearerAuthentication

Bearer authentication support for [ActiveResource](https://github.com/rails/activeresource).

[![Build Status](https://secure.travis-ci.org/Tho85/activeresource_bearer_authentication.png)](http://travis-ci.org/Tho85/activeresource_bearer_authentication) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/Tho85/activeresource_bearer_authentication)

## Installation

Add this line to your application's Gemfile:

    gem 'activeresource_bearer_authentication'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activeresource_bearer_authentication

## Usage

Set authentication type and token directly:
```ruby
class MyResource < ActiveResource::Base
  self.auth_type = :bearer
  self.token = 'my_token'

  # ...
end
```

Alternative: Set token in a block
```ruby
class MyResource < ActiveResource::Base
  self.auth_type = :bearer
  self.token do
    # Magic happens...
    SomeTokenGenerator.get_fresh_token
  end

  # ...
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
