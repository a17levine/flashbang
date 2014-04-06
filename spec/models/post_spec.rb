require 'spec_helper'

describe Post do
  
 	it "invalid without tags" do
		expect(Post.new()).to have(1).errors_on(:tags)
	end

end
