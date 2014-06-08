require 'spec_helper'

describe Post do

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
  
 	it "invalid without tags" do
		expect(Post.new(:tag_list => [])).to have(1).errors_on(:tag_list)
	end

	it "only has lowercase tags"  do
		post = Post.new()
		post.tag_list.add("UPPERCASETAG")
		expect(post.tag_list.first).to eq("uppercasetag")
	end

	

end
