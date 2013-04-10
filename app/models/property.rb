class Property < ActiveRecord::Base
	attr_accessible :property_type
	

	has_and_belongs_to_many :herbs, :join_table => :herbs_properties

	def to_s 
		"#{property_type}"
	end
end
