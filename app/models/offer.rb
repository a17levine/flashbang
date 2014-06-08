class Offer < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_presence_of :user_id, :amount
  validates :amount, :numericality => { :greater_than => 0, :integer => true }
  # validate :must_be_highest_offer

  before_create :set_accepted_false
  before_create :must_be_highest_offer
  before_create :is_post_offerable?




  private

  def is_post_offerable?
    if self.post.offers.any?{|o| o.accepted == true}
      return false
    else
      return true
    end
  end

  def set_accepted_false
    self.accepted = false
    true
  end

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