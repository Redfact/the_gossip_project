class SessionsController < ApplicationController
	include SessionHelper

	def new
		
	end


	def create
		user = User.all.find_by(email: params[:email])

		if( user && user.authenticate( params[:password])  )then
			log_in(user)
			puts "session user_id:#{session[:user_id]}".colorize(:green)
			redirect_to root_path
		else
			render :new
		end	
	end

	def destroy
		session.delete(:user_id)
		session.delete(:user_name)
		puts "session destroyed".colorize(:red)
		redirect_to root_path
	end
end
