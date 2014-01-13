module ActiveAdminMultiUpload
  module DSL

    def allows_multi_upload(options={})

      config.resource_class.send(:include, ::ActiveAdminMultiUpload::Uploadable)
      uploader = options[:mounted_uploader] ||= :image
      config.resource_class.send(:allows_upload,  uploader)

      collection_action :create_upload, method: :post do
        @upload_model = options[:model] ||= active_admin_config.resource_class
        @model = @upload_model.new(upload_resource_params)
        if @model.save
          respond_to do |format|
            format.html {
              render :json => [@model.to_jq_upload].to_json,
              :content_type => 'text/html',
              :layout => false
            }
            format.json {
              render :json => { files: [@model.to_jq_upload] }, status: :created
            }
          end
        else
          render :json => [{:error => "custom_failure"}], :status => 304
        end
      end

      member_action :destroy_upload, method: :delete do
        @upload_model = options[:model] ||= active_admin_config.resource_class
        @model = @upload_model.find(params[:id])
        @model.destroy
        render :json => true
      end

      controller do
        # Rails 4 Strong Parameters compatibility and backwards compatibility.
        def upload_resource_params
          # I don't think this will work any more.
          if respond_to?(:permitted_params)
            permitted_params[active_admin_config.resource_class.name.underscore]
          else
            params[active_admin_config.resource_class.name.underscore]
          end
        end
      end
    end
  end
end
