$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "memory_logger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "memory_logger"
  s.version     = MemoryLogger::VERSION
  s.authors     = ["Piotr Marat, Alek Niemczyk"]
  s.email       = ["info@314t.com"]
  s.homepage    = "https://github.com/timmyweb/memory-logger"
  s.summary     = "Memory Logger"
  s.description = "Memory logger for Ruby on Rails projects"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.0.0"

  s.add_development_dependency "sqlite3"
end
