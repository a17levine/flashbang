class OffersController < ApplicationController
  def new
    @offer = Offer.new
  end

  def create
    amount = params[:offer][:amount].to_i
    user_id = current_user.id
    post = Post.find(params[:post_id])

    offer = post.offers.new(user_id: user_id, amount: amount)

    if offer.save
      Notifier.notify_post_owner_when_offer_received(offer).deliver
      redirect_to post, :flash => { :notice => "offer of $#{amount} submitted successfully" }
    else
      redirect_to post, :flash => { :error => "offer invalid and not placed. Try again." }
    end
  end

  def accept
    puts "this just hit the accept action in the offers controller"
    # binding.pry
    post = Post.find(params[:post_id])
    post_owner = User.find(post.user_id)
    offer = Offer.find(params[:id])

    if current_user == post_owner
      offer.accepted = true
      offer.save
      redirect_to post, :flash => { :notice => "offer accepted!" }
    #   transfer = Transfer.new
    #   redirect_to transfer
    # else
    #   flash[:alert] = "You are not the owner of this post!"
    end
  end

end
