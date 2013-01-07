class Group < ActiveRecord::Base
	attr_accessible :group_name, :user_ids
	

	has_many :user_groups, :dependent => :destroy
	has_many :users, :through => :user_groups

	#accepts_nested_attributes_for :user_groups

	def to_s 
		"#{group_name}"
	end
end
