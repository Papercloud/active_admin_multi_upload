module ActiveAdminMultiUpload
  class Engine < ::Rails::Engine
    require 'jquery-fileupload-rails'
    require 's3_file_field'
    require 's3_direct_upload'
  end
end
