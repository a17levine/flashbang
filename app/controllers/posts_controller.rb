class PostsController < ApplicationController



	# Latest posts index
	def latest
		@latest_posts = Post.order("created_at DESC")
		@user = current_user
		@post = current_user.posts.new
	end

	# Top posts index
	def top
		
	end

	def new
		@user = current_user
		@post = current_user.posts.new
	end

	def show
		
	end

	def create
		@post = current_user.posts.create(post_params)
		redirect_to root_path
	end

	def update
		
	end

	def delete
		
	end

	private

	def post_params
		params.require(:post).permit(:user_id, :price, :description, :picture)
	end

end
