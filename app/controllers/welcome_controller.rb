class WelcomeController < ApplicationController
  def view
  	@name= "Tantely"
  	@gossips= Gossip.all
  end
end
