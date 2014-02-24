# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'customer_portal/version'

Gem::Specification.new do |spec|
  spec.name          = "customer_portal"
  spec.version       = CustomerPortal::VERSION
  spec.authors       = ["Nic Boie"]
  spec.email         = ["nic@webvolta.com"]
  spec.description   = 'Allow a LocomotiveCMS site to have a customer portal with logins and separate pages'
  spec.summary       = 'Customer Portal for LocomotiveCMS'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'yard', '~> 0.8.5'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'database_cleaner', '~> 1.2'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_dependency 'rake', '~> 10.1'
end
