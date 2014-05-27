module PostsHelper
	def offers_been_made?
		return true unless @post.max_offer.nil? == true
	end

	def hashtagify_and_linkify_tag_list(post_dot_tags_array)
		result = ""
		post_dot_tags_array.each_with_index do |tag_object, index|
			result += link_to("##{tag_object.name}", tag_path(tag_object.name))
			if index < post_dot_tags_array.length - 1
				result += " "
			end
		end
		return result.html_safe
	end

end