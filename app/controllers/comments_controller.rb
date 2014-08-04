class CommentsController < ApplicationController

  before_filter :authenticate_user!

  def create
    user_id = current_user.id
    comment_text = params[:comment][:text]
    
    if params[:post_id]
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(user_id: user_id, text: comment_text)

      if @comment.save
        dispatch_post_comment_mailer
        redirect_to @post, :flash => { :notice => "comment posted" }
      else
        redirect_to @post, :flash => { :error => "comment invalid" }
      end
    elsif params[:exchange_id]
      @exchange = Exchange.find(params[:exchange_id])
      @post = @exchange.post
      @comment = @exchange.comments.new(user_id: user_id, text: comment_text)

      if @comment.save
        dispatch_exchange_comment_mailer
        redirect_to @exchange, :flash => { :notice => "comment posted" }
      else
        redirect_to @exchange, :flash => { :error => "comment invalid" }
      end
    end
  end


  private

  def dispatch_post_comment_mailer
    if current_user == @post.user
      Notifier.delay.notify_post_followers_when_owner_comments(@comment)
    else
      Notifier.delay.notify_seller_of_comment_on_post(@comment)
    end
  end

  def dispatch_exchange_comment_mailer
    @current_user = current_user
    Notifier.delay.notify_other_party_of_comment_on_exchange(@current_user, @comment)
  end

end
