class Offer < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_presence_of :user_id, :amount
  validates :amount, :numericality => { :greater_than => 0, :integer => true }

  before_save :set_false

  private

  def set_false
    self.accepted = false
  end

end