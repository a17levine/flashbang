class User < ActiveRecord::Base
  has_many :comments
	has_many :posts
  has_many :followed_tags
  has_many :tags, through: :followed_tags
  has_many :selling_exchanges, 
           :class_name => "Exchange",
           :foreign_key  => "seller_id"

  has_many :buying_exchanges, 
           :class_name => "Exchange",
           :foreign_key  => "buyer_id"

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	 def full_name
	 	"#{self.first_name} #{self.last_name}"
	 end

   def short_name
     "#{self.first_name} #{self.last_name[0]}."
   end

   def follow_tag(tag_text)
     self.followed_tags.create(tag: Tag.find_or_create_by_name(tag_text))
   end

   def unfollow_tag(tag_text)
     self.followed_tags.where(user_id: self.id).where(tag_id: Tag.find_by(name: tag_text)).first.delete
   end

   def exchanges
     (self.selling_exchanges + self.buying_exchanges).sort_by(&:created_at)
   end

   def following_tag?(tag_text)
     @tag = Tag.where(:name => tag_text).first
     self.tags.include?(@tag)
   end

   # this logic is trash but works for now.
   def relevant_posts
    @relevant_posts = []
      self.tags.each do |t|
        posts_with_tag = Post.tagged_with(t.name).where(active: true).sort_by(&:created_at)
        posts_with_tag.each {|p| @relevant_posts << p}
      end
      if @relevant_posts.uniq == nil
        return @relevant_posts.sort!{|a,b| b.created_at <=> a.created_at}
      else
        return @relevant_posts.uniq!.sort!{|a,b| b.created_at <=> a.created_at}
      end
   end
end
