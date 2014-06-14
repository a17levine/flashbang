class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  before_save :check_for_empty_string

  private

  def check_for_empty_string
    self.text.gsub(/\s/, '') != ''
  end
end
