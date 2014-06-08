class Notifier < ActionMailer::Base
  default from: "alex@flashba.ng"


  def send_new_post_uploaded_email(user, post)
  	@post = post
    @user = user
    mail( :to => @user.email,
    :subject => 'Thank you for posting to Flashbang' )
  end

  def welcome_to_flashbang_email(user)
  end

  def notify_user_of_post_that_matches_followed_tag(post,tag)
  end

  def notify_seller_of_comment_on_post(seller, comment)
  end

  def notify_post_owner_when_offer_received(owner, offer)
  end

  def notify_offerer_when_post_owner_accepts_offer(offer)
  end

  def notify_losing_offerers_they_have_lost(post)
  end

  def notify_admin_of_something(description)
  end

end
