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

	def register_notification_to_admin(user)
		@user = user
		mail(:to => "dvporg@gmail.com", :subject => "New verification №#{@verification.id} from #{@verification.email} ")
	end

	def send_adviser_info_to_admin(adviser)
		@adviser = adviser
		@link = "http://search.investmentprotectionbureau.org/admin/advisers/#{adviser.id}"
		mail(:to => 'ipbureauusa@gmail.com', :subject => "New adviser is registered, email: #{@adviser.adviser_user.email}")
	end

	def send_adviser_info_to_user(adviser)
		@adviser = adviser
		@link = "http://search.investmentprotectionbureau.org/advisers/#{adviser.id}"
		mail(:to => @adviser.adviser_user.email, :subject => "New adviser is registered, email: #{@adviser.adviser_user.email}")
	end

	def approve_adviser(verification)
		@link = "http://search.investmentprotectionbureau.org/#{verification.adviser.id}"
		mail(:to => verification.email, :subject => "Your account have been verified, thank you!")
	end

	def dissapprove_adviser(verification)
		@link = "http://search.investmentprotectionbureau.org/advisers/contact_form"
		mail(:to => verification.email, :subject => "Your account has not approved", :host => 'qqqq.dddd.ff')
	end

	def send_contact_question(user, question)
		@user = user
		@question = question
		mail(:to => "ipbureauusa@gmail.com", :subject => "New question from #{user.email}")
	end

	def send_consultation_to_admin(adviser, consultation)
		@consultation = consultation
		mail(:to => 'ipbureauusa@gmail.com', :subject => "New consultation request from #{consultation[:firstnm] + ' ' + consultation[:lastnm]}")
	end
end

