class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  before_save :check_for_empty_string

  private

  def check_for_empty_string
    self.gsub(/\s/, '') != ''
  end
end
