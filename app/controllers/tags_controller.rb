class TagsController < ApplicationController
	
	def show
		@tag = params[:name]
		@posts_with_tag = Post.tagged_with(params[:name])
	end

	private

	def tag_params
		params.require(:tag).permit(:name)
	end

end
