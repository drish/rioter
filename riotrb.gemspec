require_relative "lib/riotrb/version"

Gem::Specification.new do |spec|
  spec.name          = "riotrb"
  spec.version       = Riotrb::VERSION

  spec.authors       = "Derich Pacheco"
  spec.email         = "carlosderich@gmail.com"

  spec.summary       = "riotrb - fully featured Riot Games API v4 wrapper"
  spec.homepage      = "https://github.com/drish/riotrb"
  spec.license       = "MIT"

  spec.files         = Dir["*.{md,txt}", "{lib,ext}/**/*"]

  spec.require_paths  = ["lib", "lib/**/*"]

  spec.add_dependency "typhoeus"

  spec.required_ruby_version = ">= 2.4"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug"
end
