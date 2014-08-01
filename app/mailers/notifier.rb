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
    attach_post_picture
    mail( :to => @user.email,
    :subject => "Thank you for posting your #{effective_post_name} to Flashbang" )
  end

  def notify_user_of_post_that_matches_followed_tag(user,post,tag)
    @post = post
    @user = user
    @tag = tag
    attach_post_picture
    mail( :to => @user.email,
    :subject => "##{@tag.name} just posted on Flashbang!" )
  end

  def notify_user_of_post_expiring(post)
    @post = post
    @user = post.user
    attach_post_picture
    mail( :to => @user.email,
    :subject => "Your #{effective_post_name} has expired" )
  end

  # Comment-related mailers ----

  def notify_seller_of_comment_on_post(comment)
    @post = comment.commentable
    @comment = comment
    @commenter = comment.user
    @owner = @post.user
    attach_post_picture
    mail( :to => @owner.email,
      :subject => "New comment on #{effective_post_name} // Flashbang" )
  end

  def notify_post_followers_when_owner_comments(comment)
    @post = comment.commentable
    @comment = comment
    @post_followers_set = @post.followers || Set.new
    attach_post_picture
    unless @post_followers_set.empty?
      @post_followers_set.each do |user|
        mail( :to => user.email,
      :subject => "Seller comment on #{effective_post_name} posted // Flashbang" )
      end
    end
  end

  def notify_other_party_of_comment_on_exchange()
  end

  # Offer-related mailers ----

  def notify_post_owner_when_offer_received(offer)
    @post = offer.post
    @offer = offer
    @owner = @post.user
    attach_post_picture
    mail( :to => @owner.email,
    :subject => "Offer of $#{@offer.amount} received on #{effective_post_name} - Flashbang" )
  end

  def confirm_offerer_of_offer(offer)
    @post = offer.post
    @offer = offer
    @offerer = offer.user
    attach_post_picture
    mail( :to => @offerer.email,
    :subject => "You offered $#{@offer.amount} on a #{effective_post_name} - Flashbang" )
  end

  def notify_winning_bidder_when_post_owner_accepts_offer(exchange)
    @exchange = exchange
    @winning_bidder = @exchange.buyer
    @post = @exchange.post
    attach_post_picture
    mail( :to => @winning_bidder.email,
    :subject => "Offer accepted! $#{@post.max_offer.amount} // #{effective_post_name} // Next steps - Flashbang" )
  end

  def confirm_owner_of_accepted_offer(exchange)
    @exchange = exchange
    @post = @exchange.post
    @post_owner = @post.user
    attach_post_picture
    mail( :to => @post_owner.email,
    :subject => "Offer accepted! $#{@post.max_offer.amount} // #{effective_post_name} // Next steps - Flashbang" )
  end

  def notify_losing_offerers_they_have_lost(post)
    @post = post
    @highest_bidder = @post.highest_bidder
    @highest_offer_amount = @post.max_offer.amount
    @losing_offerers = @post.offers.map{|o| o.user}.to_set.delete(@highest_bidder)
    attach_post_picture

    @losing_offerers.each do |lo|
      mail( :to => lo.email,
    :subject => "An offer has been accepted on #{effective_post_name} // Flashbang" ).deliver
    end
  end

  # Misc mailers ----

  def notify_admin_of_something(description)
  end

  private

  def attach_post_picture
    attachments.inline['post_image.jpg'] = File.read(@post.picture.path)
  end

  def load_common_assets
    # potential bug - this is tied to JPG
    attachments.inline['logo-small.png'] = File.read("#{Rails.root}/app/assets/images/logo-small.png")
  end

end
