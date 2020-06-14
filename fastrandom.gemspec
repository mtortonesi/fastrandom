lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fastrandom/version"

Gem::Specification.new do |spec|
  spec.name          = "fastrandom"
  spec.version       = FastRandom::VERSION
  spec.authors       = ["Mauro Tortonesi"]
  spec.email         = ["mauro.tortonesi@unife.it"]

  spec.summary       = %q{Fast random number generation library.}
  spec.description   = %q{A fast random number generation library leveraging a (portable) C implementation of the xoroshiro128+ algorithm.}
  spec.homepage      = "https://github.com/mtortonesi/ruby-fastrandom"
  spec.license       = "MIT"
  spec.files         = %w(fastrandom.gemspec) + Dir.glob("{lib,test,ext}/**/*")
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions << 'ext/Rakefile'

  spec.add_dependency "rake", "~> 13.0"
  spec.add_dependency "ffi-compiler", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "minitest", "~> 5.14"
end
