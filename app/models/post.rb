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

	def post_followers
		@non_owner_commenters = self.comments.collect{|c|
			next if c.user == c.post.user
			c.user}.compact!
		@offerers = self.offers.collect{|o| o.user}
		@unique_followers = (@non_owner_commenters + @offerers).to_set
		if @unique_followers.empty?
			nil
		else
			@unique_followers
		end
	end

	def highest_bidder
		User.find(self.user_id)
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