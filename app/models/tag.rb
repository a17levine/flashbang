class Tag < ActiveRecord::Base
  has_many :followed_tags
  has_many :users, through: :followed_tags
  before_save :cleanup_tags

  private

  def cleanup_tags
    self.name.gsub(/#/, '')
  end
end