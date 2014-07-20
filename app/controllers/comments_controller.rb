class CommentsController < ApplicationController

  before_filter :authenticate_user!

  def create
    if params[:post_id]
      comment_text = params[:comment][:text]
      @post = Post.find(params[:post_id])
      user_id = current_user.id
      
      @comment = @post.comments.new(user_id: user_id, text: comment_text)

      if @comment.save
          dispatch_comment_mailer
          redirect_to @post, :flash => { :notice => "comment posted" }
      else
          redirect_to @post, :flash => { :error => "comment invalid" }
      end    
    end
  end


  private

  def dispatch_comment_mailer
    if current_user == @post.user
      Notifier.delay.notify_post_followers_when_owner_comments(@comment)
    else
      Notifier.delay.notify_seller_of_comment_on_post(@comment)
    end
  end

end
