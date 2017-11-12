class UserMailer < ActionMailer::Base
	default :from => "noreply@woot.cl"

	def sign_upconfirmation(user)
		@user = user
		mail(:to => "#{user.first_name} <#{user.email}>", :subject => "Por favor confirmar el registro")
	end
end
