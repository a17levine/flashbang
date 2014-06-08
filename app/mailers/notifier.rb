class Notifier < ActionMailer::Base
  include PostsHelper
  add_template_helper(PostsHelper)
  default from: "alex@flashba.ng"
  before_action :load_common_assets

  # User lifecycle related mailers

  def welcome_to_flashbang_email(user)
  end

  # Post lifecycle related mailers ----

  def send_new_post_uploaded_email(user, post)
  	@post = post
    @user = user
    attachments.inline['post_image.jpg'] = File.read(@post.picture.path)
    mail( :to => @user.email,
    :subject => "Thank you for posting your #{effective_post_name} to Flashbang" )
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

  def notify_post_owner_when_offer_received(offer)
    @post = offer.post
    @offer = offer
    @owner = @post.user
    attachments.inline['post_image.jpg'] = File.read(@post.picture.path)
    mail( :to => @owner.email,
    :subject => "Offer of $#{@offer.amount} received on #{effective_post_name} - Flashbang" )
  end

  def confirm_offerer_of_offer(offer)
    @post = offer.post
    @offer = offer
    @offerer = offer.user
    attachments.inline['post_image.jpg'] = File.read(@post.picture.path)
    mail( :to => @offerer.email,
    :subject => "You offered $#{@offer.amount} on a #{effective_post_name} - Flashbang" )
  end

  def notify_winning_bidder_when_post_owner_accepts_offer(exchange)
    @exchange = exchange
    @winning_bidder = @exchange.buyer
    @post = @exchange.post
    attachments.inline['post_image.jpg'] = File.read(@post.picture.path)
    mail( :to => @winning_bidder.email,
    :subject => "Offer accepted! $#{@post.max_offer.amount} // #{effective_post_name} // Next steps - Flashbang" )
  end

  def confirm_owner_of_accepted_offer(exchange)
    @exchange = exchange
    @post = @exchange.post
    @post_owner = @post.user
    attachments.inline['post_image.jpg'] = File.read(@post.picture.path)
    mail( :to => @post_owner.email,
    :subject => "Offer accepted! $#{@post.max_offer.amount} // #{effective_post_name} // Next steps - Flashbang" )
  end

  def notify_losing_offerers_they_have_lost(post)
  end

  # Misc mailers ----

  def notify_admin_of_something(description)
  end

  private

  def load_common_assets
    # potential bug - this is tied to JPG
    attachments.inline['logo-small.png'] = File.read("#{Rails.root}/app/assets/images/logo-small.png")
  end

end
