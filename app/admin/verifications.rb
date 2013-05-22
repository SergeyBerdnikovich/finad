ActiveAdmin.register Verification do
  form :html => { :multipart => true } do |f|
    f.inputs "Помещение" do
      f.input :adviser
      f.input :adviser_user, :label => "User email"
      f.input :name
      f.input :phone
      f.input :email
    end
    f.inputs "Adviser",
      :for => [:adviser,
               if f.object.adviser
                 f.object.adviser
               else
                 f.object.build_adviser
               end
             ] do |fm|
      fm.input :verified
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :adviser
      row :adviser_user
      row :name
      row :phone
      row :email
      row :verified do |verification|
        verification.adviser.try(:verified)
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end