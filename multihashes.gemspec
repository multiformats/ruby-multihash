# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'multihashes/version'

Gem::Specification.new do |spec|
  spec.name          = "multihashes"
  spec.version       = Multihashes::VERSION
  spec.authors       = ["Kyle Drake"]
  spec.email         = ["kyle@kyledrake.net"]

  spec.summary       = %q{A simple multihash (https://github.com/jbenet/multihash) implementation for ruby.}
  spec.description   = %q{A simple, low-level multihash (https://github.com/jbenet/multihash) implementation for ruby.}
  spec.homepage      = "https://github.com/neocities/ruby-multihashes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "minitest"

  spec.add_dependency "multicodecs", ">= 0.2.0", "< 1"
end
