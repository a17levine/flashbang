class PlacesController < ApplicationController
  def create
  	# binding.pry
  	@exchange = Exchange.find(params[:exchange][:id])
  	@name = params[:place][:name]
  	@address = params[:place][:address]
  	@url = params[:place][:url]
  	@place = Place.new(name: @name, address: @address, url: @url)
  	
  	if @exchange.seller == current_user && @place.save
  		@exchange.place_id = @place
  		@exchange.save
  		redirect_to "#{exchange_path(@exchange)}#place", :flash => { :notice => "location updated" }
  	end
  end
end
