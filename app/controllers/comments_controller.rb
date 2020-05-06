class CommentsController < ApplicationController

	def create
		puts "controller create Comment".colorize(:light_green)
		@comment  = Comment.new(content: params[:content] , user_id:User.ids.sample , gossip_id: params[:id]) 

		@state = @comment.save
	  	if @state then 
	    	redirect_to gossip_path(@comment.gossip_id)
	  	else
	  		#Reaffiche la page 
	  		puts @comment.errors.full_messages
	  		redirect_to gossip_path(@comment.gossip_id) 
	    end	
	end

	def index
  		puts "controller index Gossip".colorize(:light_green)	
  	end 

	def show
		@comment = Comment.find(params[:id])
	end

	def new 
		@comment = Comment.new
	end

	def edit
		puts "controller edit comment".colorize(:light_green)
		@comment = Comment.find(params[:id])
	end

	def update
		puts "controller update comment".colorize(:light_green)
	  	com = params[:comment]

		@comment = Comment.find(params[:id].to_i)
		if @comment.update(content:com[:content])then
		    redirect_to gossip_path(@comment.gossip_id) 
		else
		  render :edit
		end
	end

	def destroy
		puts "controller delete comment".colorize(:light_green)
		comment =Comment.all.find(params[:id])
		goid = comment.gossip_id
  		comment.destroy
 	   	redirect_to  gossip_path(goid) 	
	end

end
