class ExchangesController < ApplicationController

	before_filter :authenticate_user!

	def create
		# get buyer and seller objects
		# create a new exchange with them as buyers and sellers
		# trigger a notice congratulating the seller for accepting
		# render show
	end

	def show
		# get exchange from db
		# binding.pry
		@exchange = Exchange.find(params["id"].to_i)
		# load objects
		@buyer = @exchange.buyer
		@seller = @exchange.seller
		@place = Place.new
		@user = current_user
		@comment = @exchange.comments.new
		# security: make sure only buyer or seller is viewing.
		#   otherwise return to root path with a message
	end


	# this method shows the user a table of 
	# all exchanges related to them

	def index
		@user_exchanges = User.find(params["user_id"].to_i).exchanges
	end

end
