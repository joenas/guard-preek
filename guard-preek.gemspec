# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/preek/version'

Gem::Specification.new do |spec|
  spec.name          = "guard-preek"
  spec.version       = Guard::PreekVersion::VERSION
  spec.authors       = ["Jon Neverland"]
  spec.email         = ["jonwestin@gmail.com"]
  spec.description   = %q{Simple refactoring Guard, pretty prints Reek smells}
  spec.summary       = %q{Simple refactoring Guard, pretty prints Reek smells}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "guard", '~> 1.6'
  spec.add_dependency "preek", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-given"
  spec.add_development_dependency 'coveralls'
end
