# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'liner/version'

Gem::Specification.new do |spec|
  spec.name          = "liner"
  spec.version       = Liner::VERSION
  spec.authors       = ["Josh Lewis"]
  spec.email         = ["josh.w.lewis@gmail.com"]
  spec.description   = %q{A liner for Ruby objects. Add attribute, inspection, serialization, and equality methods.}
  spec.summary       = %q{Liner is a lightweight library designed to enhance simple classes with a few conveniences and idioms while staying out of your way.}
  spec.homepage      = "https://github.com/joshwlewis/liner"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "json" if RUBY_VERSION < '1.9.2'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "coveralls" if RUBY_VERSION > '1.8.7'
end
