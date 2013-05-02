ActiveAdmin.register Adviser do
  form :html => { :multipart => true } do |f|
    f.inputs "AdviserUser" do
      f.input :adviser_user
    end
    f.inputs "Adviser" do
      f.input :name
      f.input :address
      f.input :city
      f.input :state
      f.input :zip
      f.input :phone
      f.input :url
      f.input :stars
    end
    f.inputs "Photo",
      :for => [:gallery,
               if f.object.gallery
                 f.object.gallery
               else
                 f.object.build_gallery
               end
             ] do |fm|
      fm.input :photo, :as => :file, :hint => fm.template.image_tag(fm.object.photo.url(:normal))
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :adviser_user
      row :name
      row :address
      row :city
      row :state
      row :zip
      row :phone
      row :url
      row :stars
      row :created_at
      row :updated_at
      row :photo do |adviser|
        image_tag adviser.gallery.photo.url(:normal)
      end
    end
    active_admin_comments
  end
end
