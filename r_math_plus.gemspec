# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'r_math_plus/version'

Gem::Specification.new do |spec|
  spec.name          = "r_math_plus"
  spec.version       = RMathPlus::VERSION
  spec.authors       = ["Otávio Monteagudo"]
  spec.email         = ["oivatom@gmail.com"]
  spec.summary       = %q{ Math operations to use in puzzles. }
  spec.description   = %q{ Some extra math ops to the standard library which include prime number operations and the least common multiple of an array of numbers. See the Documentation link below for further details.}
  spec.homepage      = "https://github.com/otamm/RMathPlus"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0.0"
end
