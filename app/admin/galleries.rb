ActiveAdmin.register Gallery do
    menu :parent => "Settings"
  index do
    column :id
    column :photo do |gallery|
      image_tag gallery.photo.url(:small)
    end
    column :photo_file_name
    column :photo_file_size
    column :created_at
    column :updated_at

    default_actions
  end

  form do |f|
    f.inputs "Adviser" do
      f.input :adviser
    end
    f.inputs "Photo", :multipart => true do
      f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:normal))
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :adviser
      row :photo_file_name
      row :photo_content_type
      row :photo_file_size
      row :created_at
      row :updated_at
      row :photo do
        image_tag gallery.photo.url(:normal)
      end
    end
    active_admin_comments
  end
end