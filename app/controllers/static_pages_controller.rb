class StaticPagesController < ApplicationController

	def home
		if user_signed_in?
			redirect_to latest_path
		end
	end
end
