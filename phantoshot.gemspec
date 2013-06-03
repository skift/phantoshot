# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phantoshot/version'

Gem::Specification.new do |spec|
  spec.name          = "phantoshot"
  spec.version       = Phantoshot::VERSION
  spec.authors       = ["Andrew Callahan", "Dan Nguyen"]
  spec.email         = ["dn@gskift.com"]
  spec.description   = %q{Take screenshots with phantom.js}
  spec.summary       = %q{A simple Ruby wrapper around phantom.js}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "hashie"
  spec.add_dependency "multi_json"


end
