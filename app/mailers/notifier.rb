class Notifier < ActionMailer::Base
  default from: "alex@flashba.ng"

  # User lifecycle related mailers

  def welcome_to_flashbang_email(user)
  end

  # Post lifecycle related mailers ----

  def send_new_post_uploaded_email(user, post)
  	@post = post
    @user = user
    mail( :to => @user.email,
    :subject => 'Thank you for posting to Flashbang' )
  end

  def notify_user_of_post_that_matches_followed_tag(post,tag)
  end

  # Comment-related mailers ----

  def notify_seller_of_comment_on_post(seller, comment)
  end

  def notify_potential_buyers_when_owner_comments(post)
    @potential_buyers_user_array = post.potential_buyers
  end

  def notify_other_party_of_comment_on_exchange()
  end

  # Offer-related mailers ----

  def notify_post_owner_when_offer_received(owner, offer)
  end

  def notify_offerer_when_post_owner_accepts_offer(offer)
  end

  def notify_losing_offerers_they_have_lost(post)
  end

  # Misc mailers ----

  def notify_admin_of_something(description)
  end

end
