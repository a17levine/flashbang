class Offer < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_presence_of :user_id, :amount
  validates :amount, :numericality => { :greater_than => 0, :integer => true }
  validate :must_be_highest_offer

  before_create { |offer| offer.accepted = false; true }


  def must_be_highest_offer
    amount = self.amount
    post = Post.find(self.post_id)
    offers = post.offers.sort_by(&:amount)
    
    return true if offers.empty?

    if self.amount > offers.last.amount
      return true
    else
      # self.errors[:amount] << "Your offer was not higher than the last offer!"
      return false
    end
  end
end