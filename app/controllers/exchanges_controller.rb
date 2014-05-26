class ExchangesController < ApplicationController

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
		# security: make sure only buyer or seller is viewing.
		#   otherwise return to root path with a message
	end

end
