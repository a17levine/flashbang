class FollowedtagsController < ApplicationController

  before_filter :authenticate_user!

  def index
  	if current_user.followed_tags.empty?
  		redirect_to followed_tags_show_path, :flash => { :notice => "you must follow tags to view posts you're following" }
  	else
      @relevant_posts = current_user.relevant_posts
  	end
  end

  def show
    @followed_tag = FollowedTag.new
    @followed_tags = current_user.followed_tags
  end

  def edit
  	# 
  end

  def create
    @tag_name = params['name']
    @user = current_user
    response = @user.follow_tag(@tag_name)
    render json: response.tag
  	# render nothing: true
  end

  def destroy
  	# get tag from params
    @tag_name = params['name']
    @user = current_user
  	# get user
  	# userobject.unfollow_tag(text)
    @user.unfollow_tag(@tag_name)
  	render nothing: true
  end

  def list
  	# userobject.followed_tags
  	# return tag text to view
  	render nothing: true
  end

end
