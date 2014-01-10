module ActiveAdminMultiUpload::Uploadable
  extend ActiveSupport::Concern

  included do
    include Rails.application.routes.url_helpers
  end

  module ClassMethods
    def allows_upload(name)
      code = <<-eoruby
        def to_jq_upload
          {
            "name" => read_attribute(#{name}),
            "size" => image.size,
            "url" => image.url,
            "thumbnail_url" => image.thumb.url,
            "delete_url" => destroy_upload_admin_#{self.name.downcase}_url(self, only_path: true),
            "id" => id,
            "delete_type" => "DELETE"
          }
        end
      eoruby
      class_eval(code)
    end
  end
end
