module ActiveAdminMultiUpload
  class ResourceGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def add_js_assets
      append_file "app/assets/javascripts/active_admin.js.coffee", "#= require jquery-fileupload\n"
      append_file "app/assets/javascripts/active_admin.js.coffee", "#= require jquery-fileupload/vendor/tmpl\n"
    end

    def add_css_assets
      append_file "app/assets/stylesheets/active_admin.css.scss", '@import "jquery.fileupload-ui";'
    end

    private
  end
end
