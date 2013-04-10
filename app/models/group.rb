class Group < ActiveRecord::Base
	attr_accessible :group_name, :user_ids, :region_ids
	

	has_many :user_groups, :dependent => :destroy
	has_many :users, :through => :user_groups

	has_and_belongs_to_many :regions, :join_table => :groups_regions

	#accepts_nested_attributes_for :user_groups

	def to_s 
		"#{group_name}"
	end
end
