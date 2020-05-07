class AuthorsController < ApplicationController
	include SessionHelper
  def show
  	@user = User.find(params[:id])
  end

  def new
  	
  end

  def create
  	puts "controller create User".colorize(:light_green)
	  	@user = User.new(first_name: params[:first_name] ,
	  		last_name: params[:last_name],
	  		email: params[:email],
	  		password: params[:password] ,
	  		password_confirmation: params[:conf_password] ,
	  		city_id: City.ids.sample)
	  	puts params
	  	@state = @user.save
	  	if @state then # essaie de sauvegarder en base @gossip
	    	log_in(@user)
	    	redirect_to  root_path
	  	else
	  		#Reaffiche la page 
	  		puts @user.errors.full_messages
	  		render :new 
	    end
  end

  def method_name
  	
  end
end
