module ActiveAdminMultiUpload
  class ResourceGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def add_js_assets
      js_filename = "app/assets/javascripts/active_admin.js"
      coffee_filename = js_filename + ".coffee"

      if File.exists? js_filename
        # Plain JS
        append_file js_filename, "//= require jquery-fileupload\n"
        append_file js_filename, "//= require jquery-fileupload/vendor/tmpl\n"
      elsif File.exists? coffee_filename
        # Coffeescript
        append_file coffee_filename, "#= require jquery-fileupload\n"
        append_file coffee_filename, "#= require jquery-fileupload/vendor/tmpl\n"
      else
        raise "Couldn't find #{js_filename} or #{coffee_filename} to add JS to"
      end

    end

    def add_css_assets
      scss_filename = "app/assets/stylesheets/active_admin.css.scss"
      sass_filename = "app/assets/stylesheets/active_admin.css.sass"

      if File.exists? scss_filename
        append_file scss_filename, '@import "jquery.fileupload-ui";'
      elsif File.exists? sass_filename
        append_file sass_filename, '@import "jquery.fileupload-ui"'
      else
        raise "Couldn't find #{scss_filename} or #{sass_filename}. Need one of them to add CSS imports."
      end

    end

    private
  end
end
