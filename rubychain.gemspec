
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rubychain/version"

Gem::Specification.new do |spec|
  spec.name          = "rubychain"
  spec.version       = Rubychain::VERSION
  spec.authors       = ["Stuart Hanscombe"]
  spec.email         = ["hanscs1969@yahoo.co.uk"]

  spec.summary       = "A simple blockchain built on Ruby"
  spec.description   = "A very simple ruby implementation of a blockchain, based on python version: https://dev.to/aunyks/lets-build-the-tiniest-blockchain"
  spec.homepage      = "https://github.com/thelazycamel/rubychain"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
