class FollowedtagsController < ApplicationController

  def index
  	if current_user.followed_tags.empty?
  		redirect_to followed_tags_show_path, :flash => { :notice => "you must follow tags to view posts you're following" }
  	else
  		current_user.tags.each do |t|
      	Post.tagged_with(t.name).where(active: true).sort_by(&:created_at)
    	end
  	end
    
  end

  def edit
  	# 
  end

  def create
  	# get tag from params
  	# get user
  	# userobject.follow_tag(text)
  	render nothing: true
  end

  def destroy
  	# get tag from params
  	# get user
  	# userobject.unfollow_tag(text)
  	render nothing: true
  end

  def list
  	# userobject.followed_tags
  	# return tag text to view
  	render nothing: true
  end

end
