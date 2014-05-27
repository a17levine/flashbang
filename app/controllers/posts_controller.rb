class PostsController < ApplicationController

	before_filter :authenticate_user!

	# Latest posts index
	def latest
		@latest_posts = Post.where(active: true).order("created_at DESC")
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

	# this shows the user's own posts, as user_posts(user)
	
	def index
		@user_posts = Post.where(user_id: current_user.id).where(active: true).order("created_at DESC")
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments
		@comment = @post.comments.new
		@user = current_user
		@offer = Offer.new
	end

	def create
		@post = current_user.posts.create(post_params)
		redirect_to post_path(@post), :flash => { :notice => "post uploaded successfully" }
	end

	def update
		
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.user == current_user
			@post.active = false
			if @post.save
				redirect_to user_posts_path(current_user), :flash => { :notice => "post removed successfully" }
			else
				redirect_to user_posts_path(current_user), :error => { :notice => "something went wrong" }
			end
		end
	end

	private

	def post_params
		params.require(:post).permit(:user_id, :price, :description, :picture, :tag_list)
	end

end
