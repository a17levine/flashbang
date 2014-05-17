class FollowedtagsController < ApplicationController
  def show
    @relevant_posts = []
    followed_tags = current_user.tags
    followed_tags.each do |t|
      @relevant_posts = Post.tagged_with(t.name).where(active: true)
    end
    @relevant_posts.sort_by(&:created_at)
  end
end
