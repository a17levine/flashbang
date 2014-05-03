class CommentsController < ApplicationController
  def create
    #binding.pry
    comment_text = params[:comment][:text]
    post = Post.find(params[:post_id])
    user_id = current_user.id
    
    post.comments.create(user_id: user_id, text: comment_text)
    redirect_to post
  end
end
