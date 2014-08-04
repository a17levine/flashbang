class Place < ActiveRecord::Base
	has_many :exchanges

	def static_map
		if self.address
			map = GoogleStaticMap.new(:zoom => 13, :center => MapLocation.new(:address => self.address), :width => 640, :height => 400)
			map.markers << MapMarker.new(:color => "blue", :location => MapLocation.new(:address => self.address))
			map.url
		else
			nil
		end
	end

	def get_map_image
		if self.address
			map = GoogleStaticMap.new(:zoom => 13, :center => MapLocation.new(:address => self.address), :width => 640, :height => 400)
			map.markers << MapMarker.new(:color => "blue", :location => MapLocation.new(:address => self.address))
			map.get_map
		else
			nil
		end
	end
end
