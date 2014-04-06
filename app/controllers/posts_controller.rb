class PostsController < ApplicationController

	before_filter :authenticate_user!

	# Latest posts index
	def latest
		@latest_posts = Post.order("created_at DESC")
		# if current_user
		@user = current_user
		@post = current_user.posts.new
		# else
		# 	redirect_to new_user_session_path
		# end
	end

	# Top posts index
	def top
		
	end

	def new
		@user = current_user
		@post = current_user.posts.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		binding.pry
		@post = current_user.posts.create(post_params)
		redirect_to root_path
	end

	def update
		
	end

	def delete
		
	end

	private

	def post_params
		params.require(:post).permit(:user_id, :price, :description, :picture, :tags)
	end

end
