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
      redirect_to post, success: "Your offer was sent!"
    else
      redirect_to post, alert: "There was a problem sending your offer."
    end
  end

end
