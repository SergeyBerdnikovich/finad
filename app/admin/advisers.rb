ActiveAdmin.register Adviser do
  menu :label => "Advisers DB"

  form :html => { :multipart => true } do |f|
    f.inputs "AdviserUser" do
      f.input :adviser_user
    end
    f.inputs "Adviser" do
      f.input :name
      f.input :featured
      f.input :address

      f.input :city
      f.input :state
      f.input :zip
      f.input :phone
      f.input :url
      f.input :rating
      f.input :bio      
      f.input :years_of_experience
      f.input :short_description
      f.input :compensation_arrangements, as: :text
      f.input :offers_and_pledges, as: :text
      f.input :open_hours
      f.input :experience, as: :text

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
      row :featured
      row :address
      row :city
      row :state
      row :zip
      row :phone
      row :url
      row :rating
      row :blog_url
      row :verified
      row :education
      row :years_of_experience
      row :short_description
      row :company_data
      row :compensation_arrangements
      row :offers_and_pledges
      row :services
      row :open_hours
      row :created_at
      row :updated_at
      row :photo do |adviser|
        if adviser.gallery
        image_tag adviser.gallery.photo.url(:normal)
        end
      end
    end
    active_admin_comments
  end

  index do
    column :id
    column :adviser_user
    column :name
    column :featured
    column :address
    column :city
    column :state
    column :zip
    column :phone
    column :url
    column :rating
    column :blog_url
    column :verified
    column :created_at
    column :updated_at

    default_actions
  end
end
