module SessionHelper

	def Current_user
		User.all.find(session[:user_id])
	end

	def log_in(user)
		session[:user_id]=user.id
		session[:user_name]=user.first_name
	end
end