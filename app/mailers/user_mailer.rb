class UserMailer < ActionMailer::Base
    default :from => "register@investmentprotectionbureau.org"

	def deliver_registration_confirmation(user)
	  @user = user
	  @url  = "http://example.com/login"
	  mail(:to => user.email, :subject => "Thank you for Request")
	end

	def contact(adviser, user, email, comment)
		@adviser = adviser
		@user = user
	 	@email = email
	 	@comment = comment
	    mail(:to => "ipbureauusa@gmail.com", :subject => "Request from #{email} regarding #{adviser.name}, #{adviser.city}, #{adviser.state}, ZIP: #{adviser.zip}")
	end

	def complaint(complaint)
		@complaint = complaint
	    mail(:to => "ipbureauusa@gmail.com", :subject => "You have receive a complain regarding #{@complaint.adviser_name} from #{@complaint.name} ")
	end

	def user_complaint(complaint)
		@complaint = complaint
	    mail(:to => @complaint.email, :subject => "Your case is registered ##{@complaint.id}")
	end

	def send_verification_confirm_to_user(verification)
		@verification = verification
		mail(:to => verification.email, :subject => "New verification №#{@verification.id} from investmentprotectionbureau.org ")
	end

	def send_verification_confirm_to_admin(verification)
		@verification = verification
		mail(:to => "ipbureauusa@gmail.com", :subject => "New verification №#{@verification.id} from #{@verification.email} ")
	end
end

