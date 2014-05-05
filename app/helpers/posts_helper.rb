module PostsHelper
	def offers_been_made?
		return true unless @post.max_offer.nil? == true
	end
end