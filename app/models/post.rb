class Post < ActiveRecord::Base
	belongs_to :user
	acts_as_taggable
	
	validates_presence_of :user_id
	mount_uploader :picture, PostPhotoUploader
	# before_create :init_score
	# before_save :update_score

	# def init_score
	# 	# self.score = Math::log(100)
	# end

	# def update_score
	# 	# self.score = Math::log(100 / (Time.now - self.created_at))
	# end
end
