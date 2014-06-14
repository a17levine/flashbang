require 'spec_helper'
require 'faker'

describe Post do
  
 	it "invalid without tags" do
		expect(Post.new(:tag_list => [])).to have(1).errors_on(:tag_list)
	end

	it "only has lowercase tags"  do
		post = Post.new()
		post.tag_list.add("UPPERCASETAG")
		expect(post.tag_list.first).to eq("uppercasetag")
	end

	it "returns post followers array when #post_followers is called, not owner" do
		owner = FactoryGirl.create(:user)
		post = FactoryGirl.create(:post, :user_id => owner.id)
		offerer = FactoryGirl.create(:user)
		commenter = FactoryGirl.create(:user)

		#commenter comments on post
		FactoryGirl.create(:post_comment, user_id: commenter.id, post_id: post.id)

		#offerer offers on post
		FactoryGirl.create(:offer, user_id: offerer.id, post_id: post.id)

		# binding.pry
		expect(post.post_followers).should include(offerer)
		# expect(post.post_followers).should include(commenter)
		expect(post.post_followers).should_not include(owner)

	end

end



	# ugh fuck this test ... testing that tags is a pain

	# it "is valid with a user_id, picture, price, and tags" do
	# 	post = Post.new(
	# 			user_id: 1,
	# 			price: 54.1,
	# 			picture: "I'm a picture",
	#       # this is the line i cant figure out below
	# 			tag_list: ActsAsTaggableOn::TagList.new(ActsAsTaggableOn::Tag.new(name:"foo"), ActsAsTaggableOn::Tag.new(name:"bar"))
	# 		)

	# 	expect(post).to be_valid
	# end
