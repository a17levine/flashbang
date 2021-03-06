class Exchange < ActiveRecord::Base
  belongs_to :buyer, :class_name => "User", foreign_key: "buyer_id"
  belongs_to :seller, :class_name => "User",  foreign_key: "seller_id"
  belongs_to :post
  belongs_to :place
  has_many :comments, as: :commentable
end
