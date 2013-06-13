ActiveAdmin.register AdviserUser do
menu :label => "Advisers Login Credentials"

filter :email   



index do

  	column :email                
  	#column :adviser do
    column :adviser do |adviser_user|
    	 links = ''.html_safe
    	if adviser_user.adviser

    	links = link_to(adviser_user.adviser.name, admin_adviser_path(adviser_user.adviser))
   	 end
   	 links
  	end                
    column :sign_in_count    
    column :current_sign_in_at
    column :last_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_ip
    column :created_at       
    column :updated_at         
    column :confirmed_at
    column :confirmation_sent_at
     default_actions
 end
end
