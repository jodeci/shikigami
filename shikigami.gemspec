# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shikigami/version"

Gem::Specification.new do |spec|
  spec.name = "shikigami"
  spec.version = Shikigami::VERSION
  spec.date = "2016-11-21"
  spec.description = "very early devlopment, use at own risk XD"
  spec.summary = "making CRUD apps as brain dead easy as possible"
  spec.authors = ["Tsehau Chao"]
  spec.email = ["jodeci@5xruby.tw"]
  spec.homepage = "https://github.com/jodeci/shikigami"
  spec.files = `git ls-files`.split("\n")
  spec.license = "MIT"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "actionview", "~> 5.0"
end
