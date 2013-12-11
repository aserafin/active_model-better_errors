# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_model/better_errors/version"

Gem::Specification.new do |spec|
  spec.name          = "active_model-better_errors"
  spec.version       = ActiveModel::BetterErrors::VERSION
  spec.authors       = ["Aaron Qian", "Byron Anderson", "Kurtis Rainbolt-Greene"]
  spec.email         = ["aq1018@gmail.com", "byronanderson32@gmail.com", "me@kurtisrainboltgreene.name"]
  spec.summary       = %q{API consumable error messages with ActiveModel::Errors drop-in compatibility.}
  spec.description   = spec.summary
  spec.homepage      = "http://aq1018.github.io/active_model-better_errors"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"]
  spec.executables   = Dir["bin/**/*"].map! { |f| f.gsub(/bin\//, "") }
  spec.test_files    = Dir["test/**/*", "spec/**/*"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activemodel", ">= 3.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "yard", "~> 0.8"
  spec.add_development_dependency "kramdown", "~> 1.2"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "coveralls", "~> 0.7"
  spec.add_development_dependency "rubocop", "~> 0.15"
end


