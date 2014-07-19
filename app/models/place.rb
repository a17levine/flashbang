class Place < ActiveRecord::Base
	has_many :exchanges

	def static_map
		if self.address
			map = GoogleStaticMap.new(:zoom => 13, :center => MapLocation.new(:address => self.address), :width => 640, :height => 600)
			map.markers << MapMarker.new(:color => "blue", :location => MapLocation.new(:address => self.address))
			map.url
		else
			nil
		end
	end
end
