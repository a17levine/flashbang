class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, as: :commentable
	has_many :offers
	
	acts_as_taggable
	
	validates_presence_of :user_id
	validates_presence_of :picture
	validates_presence_of :tag_list
	mount_uploader :picture, PostPhotoUploader

	before_save :cleanup_tags
	before_create :set_post_as_active

	def max_offer
		if self.offers
			self.offers.order("amount DESC").first
		else
			return nil
		end
	end

	# this method returns a set of Users
	# who either commented made an offer 
	# on the post (who aren't the owner)

	def followers
		@unique_followers_set = Set.new

		self.comments.each do |c|
			next if c.user == c.commentable.user
			@unique_followers_set << c.user
		end

		self.offers.each do |o|
			@unique_followers_set << o.user
		end

		if @unique_followers_set.empty? == true
			return nil
		end

		return @unique_followers_set
	end

	def highest_bidder
		if self.max_offer
			self.max_offer.user
		end
	end

	def meta_data
		offer_count = self.offers.count
		comment_count = self.comments.count

		{
			offer_count: offer_count,
			comment_count: comment_count,
		}
	end

	def offer_accepted?
		if self.offers.count == 0
			false
		else
			self.offers.each {|o| return true if o.accepted == true}
			false
		end
	end

	def unique_users_following_this_posts_tags
		@unique_users_following_this_posts_tags = Set.new
		self.tags.each do |pt|
			FollowedTag.where(tag_id: pt.id).each do |ft|
				 @unique_users_following_this_posts_tags << ft.user
			end
		end
		return @unique_users_following_this_posts_tags
	end

	def expire
		@old_post = self
		@old_post.active = false
		if @old_post.save
			Notifier.delay.notify_user_of_post_expiring(@old_post)
		end
	end

	def expiration_date
		self.created_at + 45.days
	end


	private

	def set_post_as_active
		self.active = true
	end

	def cleanup_tags
		self.tag_list.map! { |tag| tag.downcase.gsub(/#/, '') }
	end
end









# purgatory -----------------

# before_create :init_score
# before_save :update_score

# def init_score
# 	# self.score = Math::log(100)
# end

# def update_score
# 	# self.score = Math::log(100 / (Time.now - self.created_at))
# end