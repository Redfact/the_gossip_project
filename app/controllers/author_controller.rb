class AuthorController < ApplicationController
  def viewauthor
  	@user = User.find(params[:id])
  end
end
