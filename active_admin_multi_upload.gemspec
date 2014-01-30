$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_admin_multi_upload/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_admin_multi_upload"
  s.version     = ActiveAdminMultiUpload::VERSION
  s.authors     = ["Isaac Norman"]
  s.email       = "idn@papercloud.com.au"
  s.homepage    = "https://github.com/Papercloud/active_admin_multi_upload"
  s.summary     = "Allows for the upload of multiple files at once to ActiveAdmin"
  s.description = "Allows a user to upload multiple files within Active Admin. Includes features such as Progress Bars and image previews."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "jquery-fileupload-rails"
  s.add_dependency "s3_direct_upload"
end
