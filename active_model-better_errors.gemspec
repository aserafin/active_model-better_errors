# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_model/better_errors/version'

Gem::Specification.new do |spec|
  spec.name          = "active_model-better_errors"
  spec.version       = ActiveModel::BetterErrors::VERSION
  spec.authors       = ["Aaron Qian", "Byron Anderson"]
  spec.email         = ["aq1018@gmail.com", "byronanderson32@gmail.com"]
  spec.description   = "API consumable error messages with ActiveModel::Errors drop-in compatibility."
  spec.summary       = "active_model-better_errors is a ActiveModel::Errors compatible library to help you customize the presentation of your error messages."
  spec.homepage      = "http://github.com/aq1018/active_model-better_errors"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activemodel", ">= 3.0"

  spec.add_development_dependency "mocha", '>= 0.12.1'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "yard", "~> 0.8"
  spec.add_development_dependency "kramdown", "~> 1.2"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "coveralls", "~> 0.7"
end


