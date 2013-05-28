# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fafactory/version'

Gem::Specification.new do |spec|
  spec.name          = "fafactory"
  spec.version       = Fafactory::VERSION
  spec.authors       = ["Alan Johnson", "Taylor Shuler"]
  spec.email         = ["alan@gnoso.com", "taylorshuler@aol.com"]
  spec.description   = %q{Fafactory (originally Far Away Factory) is a tool for remotely creating instances of ActiveRecord models within a service. This is useful when doing integration tests of services, because it allows you to set up the environment within the remote service from your test, rather than trying to keep an instance of the service in pristine shape.}
  spec.summary       = %q{Framework for creating objects in remote services.}
  spec.homepage      = "http://github.com/gnoso/fafactory"
  spec.license       = "Apache License 2.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency "activeresource", ">= 2.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "cucumber", ">= 1.2.0"
  spec.add_development_dependency "rspec", ">= 2.12"
end
