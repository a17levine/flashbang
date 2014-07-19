class PlacesController < ApplicationController

  before_filter :authenticate_user!
  
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

  def destroy
    @exchange = Exchange.find(params[:exchange_id].to_i)
    if @exchange.seller == current_user
      @exchange.place = nil
      @exchange.save
      redirect_to "#{exchange_path(@exchange)}#place", :flash => { :alert => "location removed" }
    else
      redirect_to "#{exchange_path(@exchange)}#place", :flash => { :error => "something went wrong" }
    end
  end
end
