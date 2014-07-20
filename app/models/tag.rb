class Tag < ActiveRecord::Base
  has_many :followed_tags
  has_many :users, through: :followed_tags
  before_save :cleanup_tags

  def users_following
  	@users_following = Set.new
  	FollowedTag.where(tag_id: self.id).each do |ft|
  		@users_following << ft.user
  	end
  	return @users_following
  end

  private

  def cleanup_tags
    letter_digits = /^([0-9]*[a-zA-Z][a-zA-Z0-9]*)$/
    result_of_regexp = letter_digits =~ self.name
    self.name.gsub(/#/, '') # remove hashtag
    self.name.downcase! # lowercase
    if result_of_regexp == nil
      return false
    end
  end
end