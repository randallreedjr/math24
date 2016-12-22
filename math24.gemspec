# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'math24/version'

Gem::Specification.new do |spec|
  spec.name          = "math24"
  spec.version       = Math24::VERSION
  spec.authors       = ["Randall Reed, Jr."]
  spec.email         = ["randallreedjr@gmail.com"]

  spec.summary       = %q{Gem to provide Math 24 game functionality.}
  spec.description   = %q{Randomly generates a solvable 24 Game problem, verifies user's solution, or finds a solution for a given set of numbers.}
  spec.homepage      = "http://www.getto24.com"
  spec.license       = "MIT"



  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
