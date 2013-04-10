class Region < ActiveRecord::Base
	attr_accessible :region_name
	

	has_and_belongs_to_many :groups, :join_table => :groups_regions

	def to_s 
		"#{region_name}"
	end

end
