ActiveAdmin.register Verification do
  number = Adviser.where("id IN (SELECT adviser_id AS id FROM verifications) AND verified IS NULL").count

  if number == 0
    menu :label => "Verifications"
  else
    menu :label => "Verifications (unapproved: #{number})"
  end


   config.batch_actions = false
   action_item  do
#      link_to('Approve', approve_admin_verification(verification))
    end

    member_action :approve, :method => :post do
     @verification = Verification.find(params[:id])
     @verification.adviser.update_attribute(:verified, true)
     @verification.touch
     UserMailer.approve_adviser(@verification).deliver
     redirect_to admin_verifications_path(), :method => :get, :notice => "Adviser approved!"
    end

    member_action :dissapprove, :method => :post do
     @verification = Verification.find(params[:id])
     @verification.adviser.update_attribute(:verified, false)
     @verification.touch
     UserMailer.dissapprove_adviser(@verification).deliver
     redirect_to admin_verifications_path(), :method => :get, :notice => "Adviser approved!"
    end



      filter :id
      filter :adviser_user
      filter :phone
      filter :email
      filter :verified
      filter :created_at
      filter :updated_at


  form :html => { :multipart => true } do |f|

    f.inputs :for => :advisers do |advisers, i|
      f.input :adviser,:input_html => { :disabled => true, :style => 'display:none' }, hint: link_to(f.object.adviser.try(:name), admin_adviser_path(f.object.adviser), :target => "_blank"), as: :string
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

  index do

      column :id
      column :adviser
      column :adviser_user
      column :name
      column :phone
      column :email
          column :verified do |verification|
          if verification.adviser.try(:verified)

            "Approved"
          elsif verification.adviser.try(:verified) == false
            "Dissapproved"
          else
            "Pending"
          end
      end
      column :created_at
      column :updated_at
      column :actions do |verification|
      links = ''.html_safe
        if verification.adviser.verified == nil
        links += button_to "Approve", approve_admin_verification_path(verification)
        links += "."
        links += button_to "Disapprove", dissapprove_admin_verification_path(verification)
        end

        links += link_to I18n.t('active_admin.view'), resource_path(verification), :class => "member_link view_link"


        links += link_to I18n.t('active_admin.edit'), edit_resource_path(verification), :class => "member_link edit_link"


        links += link_to I18n.t('active_admin.delete'), resource_path(verification), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"

      links
    end

 #   default_actions
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

