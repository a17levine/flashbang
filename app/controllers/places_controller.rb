class PlacesController < ApplicationController
  def create
  	@exchange = Exchange.find(params[:exchange][:id].to_i)
  	@name = params[:place][:name]
  	@address = params[:place][:address]
  	@url = params[:place][:url]
  	@place = Place.new(name: @name, address: @address, url: @url)
  
  	if @exchange.seller == current_user
  		@place = Place.where(:address => @address).first_or_create do |p|
  			p.attributes = {name: @name, address: @address, url: @url}
  		end
  		@exchange.place_id = @place.id
  		@exchange.save
  		redirect_to "#{exchange_path(@exchange)}#place", :flash => { :notice => "location updated" }
  	end
  end
end
