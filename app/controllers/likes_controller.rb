class LikesController < ApplicationController
	before_action :authenticate_user, only: [:new, :create,:destroy]

	def authenticate_user
		unless session[:user_id]
			redirect_to new_session_path
		end
	end


	def alreadylike

	end

	def new
		puts "Controller new like".colorize(:green)
		@like = Like.new
	end

	def create
		puts "Controller create like".colorize(:green)
		puts params
		@like = Like.new(user_id:params[:user_id], gossip_id: params[:gossip_id] )
		@state= @like.save
			 if(!@state)
			 	puts @like.errors.full_messages
			 else 		
			 	redirect_to root_path
			 end
	end

	def destroy
		puts "Controller destroy like".colorize(:red)
		puts params
		@like=Like.find(params[:id])
		@like.destroy
		redirect_to root_path
	end
end
