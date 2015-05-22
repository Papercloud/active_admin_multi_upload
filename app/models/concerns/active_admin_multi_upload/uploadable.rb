module ActiveAdminMultiUpload::Uploadable
  extend ActiveSupport::Concern

  included do
    include Rails.application.routes.url_helpers
  end

  module ClassMethods
    def allows_upload(name)
      code = <<-eoruby
        def to_jq_upload
          uploader = send("#{name}")
          thumb_url =  uploader.respond_to?(:thumb) ?  uploader.thumb.url : ""
          {
            "name" => uploader.filename,
            "size" => uploader.size,
            "url" => uploader.url,
            "thumbnail_url" => thumb_url,
            "delete_url" => destroy_upload_admin_#{self.name.underscore}_url(self, only_path: true),
            "id" => id,
            "delete_type" => "DELETE"
          }
        end
      eoruby
      class_eval(code)
    end
  end
end
