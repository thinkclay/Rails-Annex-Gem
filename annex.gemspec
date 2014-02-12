$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "annex/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "annex-cms"
  s.version     = Annex::VERSION
  s.authors     = ["Clay McIlrath"]
  s.email       = ["thinkclay@gmail.com"]
  s.homepage    = "http://thinkclay.com"
  s.summary     = "The simplest implentation of a CMS"
  s.description = "An inline editor CMS powered by redactor, devise and mongodb. Up and running in seconds"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "mongoid", "~> 4.0.0.alpha2"
end
