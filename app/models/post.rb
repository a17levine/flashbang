class Post < ActiveRecord::Base
	belongs_to :user
	acts_as_taggable
	
	validates_presence_of :user_id
	validates_presence_of :picture
	validates_presence_of :tag_list
	mount_uploader :picture, PostPhotoUploader


	# shows price in $899 format instead of 899
	def price_human
		"$#{self.price}"
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