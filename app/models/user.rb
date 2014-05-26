class User < ActiveRecord::Base
  has_many :comments
	has_many :posts
  has_many :followed_tags
  has_many :tags, through: :followed_tags
  has_many      :selling_exchanges, 
                :class_name => "Exchange",
                :foreign_key  => "seller_id"

  has_many      :buying_exchanges, 
                :class_name => "Exchange",
                :foreign_key  => "buyer_id"

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	 def full_name
	 	"#{self.first_name} #{self.last_name}"
	 end

   def exchanges
     (self.selling_exchanges + self.buying_exchanges).sort_by(&:created_at)
   end
end
