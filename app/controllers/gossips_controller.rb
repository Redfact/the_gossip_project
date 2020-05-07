	
class GossipsController < ApplicationController
	before_action :authenticate_user, only: [:new , :create]
	before_action :isMyGossip, only: [:edit, :update ,:destroy]

	def authenticate_user
		unless session[:user_id]
			redirect_to new_session_path
		end
	end

	def isMyGossip
		if( !User.find(session[:user_id]).gossips.ids.include?(params[:id].to_i) )
			redirect_to gossip_path
		end
	end
	
  def show
  	@gossip = Gossip.find(params[:id])
  	@user=@gossip.user
  	@comments= @gossip.comments	
  end

  def new
  	puts "controller new Gossip".colorize(:light_green)

  end

  def create
	  	puts "controller create Gossip".colorize(:light_green)
	  	@gossip = Gossip.new(title: params[:title] ,content: params[:content],user_id: session[:user_id])
	  	puts params[:title].colorize(:light_green), params[:content].colorize(:light_green)
	  	@state = @gossip.save
	  	if @state then # essaie de sauvegarder en base @gossip
	  		flash[:success] = "Votre Gossip a été publié !"
	    	redirect_to  root_path
	  	else
	  		#Reaffiche la page 
	  		puts @gossip.errors.full_messages
	  		render new_gossip_path 
	    end
  end

  def index
  	puts "controller index Gossip".colorize(:light_green)	
  end 

  def edit
   	@gossip = Gossip.find(params[:id])
  end 

  def update
	  	puts "controller update Gossip".colorize(:light_green)
	  	gsp = params[:gossip]
	  	puts gsp[:title].colorize(:light_red),gsp[:content].colorize(:light_green)

		  	@gossip = Gossip.find(params[:id])
		if @gossip.update(title:gsp[:title], content:gsp[:content])then
		    redirect_to gossip_path
		else
		  render :edit
		end
  	end

  	def destroy
  		puts "controller delete Gossip".colorize(:light_green)
  		#Detruit les commentaires avant de détruire le gossip
  		gosp = Gossip.all.find(params[:id])
  		gosp.comments.destroy_all
  		gosp.likes.destroy_all
  		gosp.destroy
 	   	redirect_to  root_path
  	end

end
