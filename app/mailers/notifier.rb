class Notifier < ActionMailer::Base
  default from: "alex@flashba.ng"


  def send_new_post_uploaded_email(user, post)
  	@post = post
    @user = user
    mail( :to => @user.email,
    :subject => 'Thank you for posting to Flashbang' )
  end
end
