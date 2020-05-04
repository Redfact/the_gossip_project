class GossipController < ApplicationController
  def view
  	@gossip = Gossip.find_by(title:params[:title])
  	@user=@gossip.user	
  end
end
