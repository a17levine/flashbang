class Tag < ActiveRecord::Base
  has_many :followed_tags
  has_many :users, through: :followed_tags
end