class PostNotifier
  include Sidekiq::Worker

  def perform(new_post_id)
  	@new_post = Post.find(new_post_id)
  	@tags_on_post = @new_post.tags.map {|t| t.id}
  	uuftpt = @new_post.unique_users_following_this_posts_tags.delete(@new_post.user)
  	uuftpt.each do |user|
  		user.followed_tags.each do |followed_tag| 
  			if @tags_on_post.include?(followed_tag.tag.id)
  				Notifier.delay.notify_user_of_post_that_matches_followed_tag(user,@new_post,followed_tag.tag)
	  			break	
  			end
  		end 
  	end
  end

end