# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jp_bank/version'

Gem::Specification.new do |spec|
  spec.name          = "jp_bank"
  spec.version       = JpBank::VERSION
  spec.authors       = ["Tatsuya Sato"]
  spec.email         = ["satoryu.1981@gmail.com"]
  spec.summary       = %q{Provide mapping from bank code to bank information}
  spec.description   = %q{Provide mapping from bank code to bank information}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.0"
  spec.add_development_dependency "tapp"
end
