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
      Notifier.delay.notify_post_owner_when_offer_received(offer)
      Notifier.delay.confirm_offerer_of_offer(offer)
      redirect_to post, :flash => { :notice => "offer of $#{amount} submitted successfully" }
    else
      redirect_to post, :flash => { :error => "offer invalid and not placed. Try again." }
    end
  end

  def accept
    @post = Post.find(params[:post_id])
    post_owner = @post.user
    offer = @post.max_offer

    if current_user == post_owner
      offer.accepted = true
      offer.save
      @exchange = Exchange.create(
        buyer: offer.user,
        seller: post_owner,
        post: @post)

      dispatch_offer_accepted_mailers
      redirect_to @exchange, :flash => { :notice => "offer accepted! coordinate exchange" }
    else
      flash[:alert] = "You are not the owner of this post!"
    end
  end

  private

  def dispatch_offer_accepted_mailers
    Notifier.delay.notify_winning_bidder_when_post_owner_accepts_offer(@exchange)
    Notifier.delay.confirm_owner_of_accepted_offer(@exchange)
    Notifier.delay.notify_losing_offerers_they_have_lost(@post)
  end

end
