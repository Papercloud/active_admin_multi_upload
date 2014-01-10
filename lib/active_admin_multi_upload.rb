require "active_admin_multi_upload/engine"
require "active_admin_multi_upload/dsl"

module ActiveAdminMultiUpload
end

::ActiveAdmin::DSL.send(:include, ActiveAdminMultiUpload::DSL)
