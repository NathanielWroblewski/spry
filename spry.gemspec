# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spry/version'

Gem::Specification.new do |spec|
  spec.name          = "spry"
  spec.version       = Spry::VERSION
  spec.authors       = ["Nathaniel Wroblewski"]
  spec.email         = ["nathanielwroblewski@gmail.com"]
  spec.description   = %q{Run performance regression tests for your Rails app}
  spec.summary       = %q{Spry automates perf tests and graphs the results}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
