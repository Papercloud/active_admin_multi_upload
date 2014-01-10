$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_admin_multi_upload/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_admin_multi_upload"
  s.version     = ActiveAdminMultiUpload::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ActiveAdminMultiUpload."
  s.description = "TODO: Description of ActiveAdminMultiUpload."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0.0"
end
