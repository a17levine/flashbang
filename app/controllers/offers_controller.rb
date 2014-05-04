class OffersController < ApplicationController
  def new
    @offer = Offer.new
  end

  def create
    amount = params[:offer][:amount].to_i
    user_id = current_user.id
    post = Post.find(params[:post_id])

    # offer = post.offers.new(user_id: user_id, amount: amount, accepted:false)

    offer = post.offers.new(user_id: user_id, amount: amount)

    if offer.save
      redirect_to post, success: "Your offer was sent!"
    else
      redirect_to post, :flash => { :error => "There was a problem submitting your offer" }
      # binding.pry
    end
  end

  # def accept_offer
  #   post = Post.find(params[:post_id])
  #   post_owner = User.find(post.user_id)

  #   if current_user == post_owner
  #     offer = Offer.find(params[:offer_id])
  #     offer.accept_offer
  #     transfer = Transfer.new
  #     redirect_to transfer
  #   else
  #     flash[:alert] = "You are not the owner of this post!"
  #   end
  # end

end
