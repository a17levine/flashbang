class CommentsController < ApplicationController
  def create
    #binding.pry
    comment_text = params[:comment][:text]
    post = Post.find(params[:post_id])
    user_id = current_user.id
    
    comment = post.comments.new(user_id: user_id, text: comment_text)

    if comment.save
    	redirect_to post, :flash => { :notice => "comment posted" }
    else
    	redirect_to post, :flash => { :error => "comment invalid" }
    end
  end
end
