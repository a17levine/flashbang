class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :offers
	
	acts_as_taggable
	
	validates_presence_of :user_id
	validates_presence_of :picture
	validates_presence_of :tag_list
	mount_uploader :picture, PostPhotoUploader

	before_save :cleanup_tags

	# shows price in $899 format instead of 899
	def price_human
		"$#{self.price}"
	end

	def max_offer
		if self.offers
			self.offers.order("amount DESC").first
		else
			return nil
		end
	end

	def max_offer_to_display
		if self.max_offer
			return "$#{self.max_offer.amount}"
		else
			return "No offers yet"
		end
		
	end

	private

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