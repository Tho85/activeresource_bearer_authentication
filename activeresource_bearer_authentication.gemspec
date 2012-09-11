# -*- encoding: utf-8 -*-
require File.expand_path('../lib/active_resource/bearer_authentication/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Thomas Hollstegge"]
  gem.email         = ["thomas.hollstegge@zweitag.de"]
  gem.description   = %q{Bearer authentication support for ActiveResource}
  gem.summary       = %q{Adds bearer authentication to ActiveResource}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "activeresource_bearer_authentication"
  gem.require_paths = ["lib"]
  gem.version       = ActiveResource::BearerAuthentication::VERSION

  gem.add_dependency 'activesupport', '~> 3.2.8'
  gem.add_dependency 'activeresource', '~> 3.2.8'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 2.11.0'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'pry'
end
