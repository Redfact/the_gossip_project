class AuthorsController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def method_name
  	
  end
end
