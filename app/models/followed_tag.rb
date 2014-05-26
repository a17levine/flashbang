class FollowedTag < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag

  validates :tag_id, uniqueness: {scope: :user_id}
end
