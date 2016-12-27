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
  spec.files = Dir["lib/**/*", "app/**/*", "LICENSE.txt", "README.md"]
  spec.license = "MIT"

  spec.add_dependency "activesupport", ">= 4.1.0"
  spec.add_dependency "kaminari", "~> 0.17"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  # spec.add_development_dependency "rails", "~> 5.0.1"
  # spec.add_development_dependency "sqlite3", "~> 1.3"
  # spec.add_development_dependency "rspec", "~> 3.0"
  # spec.add_development_dependency "rspec-rails", "~> 3.0"
  # spec.add_development_dependency "shoulda-matchers", "~> 3.1"
  # spec.add_development_dependency "rails-controller-testing", "~> 1.0"
  # spec.add_development_dependency "factory_girl_rails", "~> 4.7"
  # spec.add_development_dependency "database_cleaner", "~> 1.5"
end
