# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cassandra_cleaner/version'

Gem::Specification.new do |spec|
  spec.name          = "cassandra_cleaner"
  spec.version       = CassandraCleaner::VERSION
  spec.authors       = ["artemk"]
  spec.email         = ["me@artemk.name"]
  spec.summary       = %q{it is like database_cleaner but for cql-rb (cassandra)}
  spec.description   = %q{it is like database_cleaner but for cql-rb (cassandra)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
