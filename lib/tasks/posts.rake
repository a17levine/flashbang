namespace :posts do
  desc "TODO"
  task expire_old: :environment do
  	old_posts = Post.where("active = ? AND created_at < ?", true, 45.days.ago)
  	old_posts.each do |op|
  		op.expire
  	end
  end

end
