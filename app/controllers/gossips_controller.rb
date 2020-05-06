	
class GossipsController < ApplicationController
  def show
  	@gossip = Gossip.find(params[:id])
  	@user=@gossip.user	
  end
  def new
  	puts "controller new Gossip".colorize(:light_green)

  end

  def create
	  	puts "controller create Gossip".colorize(:light_green)
	  	@gossip = Gossip.new(title: params[:title] ,content: params[:content],user_id: User.ids.sample)
	  	puts params[:title].colorize(:light_green), params[:content].colorize(:light_green)
	  	if @gossip.save then # essaie de sauvegarder en base @gossip
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

end
