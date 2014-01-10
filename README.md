ActiveAdminMultiUpload
========

### Support for multiple image upload for a nested resource in ActiveAdmin

_This gem was built to work with Carrierwave & ActiveAdmin, and is based on the excellent jquery-fileupload-system._

ActiveAdminMultiUpload is a version of jquery-fileupload-ui built to work with nested objects and ActiveAdmin 1.0. It supports all major features including file-previews and progress bars, and has been built so as to have the simplest implentation possible. It has been tested with Rails 4.0.2 and Ruby 2.1.0

Getting Started
========

Carrierwave
--------

This gem relies on [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) to work. If you are unfamiliar with Carrierwave then I recommend have a look through it before using this gem. You can also check out [This Railscast](http://railscasts.com/episodes/253-carrierwave-file-uploads) by Ryan Bates to help you get started.

Installation
--------

Add the gem to your Gemfile

`gem "active_admin_multi_upload"`

and then run `bundle install`

Setup
--------

For the sake of simplification for all examples below I am going to use the sample data.

* `Picture` will be the model that has an uploader associated with its `:image` attribute
* `Gallery` has many `:pictures`

You can also assume the `@gallery` refers to the current gallery that we are creating/editing.

**Substitute these with your own models and associations**

### Allow the Params

In `/admin/gallery.rb` add `permit_params picture_ids: []`

### Add the uploader

Within your form render the `active_admin_multi_upload/upload_form`

    <%= f.inputs "Pictures" do %>
      <%= render "active_admin_multi_upload/upload_form", :resource => @gallery, :association => "pictures", attribute: "image" %>
    <% end %>

Options
---------



This project rocks and uses MIT-LICENSE.
