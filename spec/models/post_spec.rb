require 'spec_helper'

describe Post do
  
 	it "invalid without tags" do
		expect(Post.new(:tags => [])).to have(1).errors_on(:tags)
	end

end
