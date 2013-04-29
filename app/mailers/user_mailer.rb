class UserMailer < ActionMailer::Base
    default :from => "dvporg@gmail.com"

	def deliver_registration_confirmation(user)
	  @user = user
	  @url  = "http://example.com/login"
	  mail(:to => user.email, :subject => "Thank you for Request")
	end

end