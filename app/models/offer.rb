class Offer < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_presence_of :user_id, :value
  validates :value, :numericality => { :greater_than => 0, :integer => true }



end