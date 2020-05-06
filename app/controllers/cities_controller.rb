class CitiesController < ApplicationController
  def show
  	@city = City.find(params[:id])
  	@gossips = @city.gossips
  	puts @city.name.colorize(:green)
  end

end
