class FollowedtagsController < ApplicationController

  def index
    current_user.tags.each do |t|
      Post.tagged_with(t.name).where(active: true).sort_by(&:created_at)
    end
  end

end
