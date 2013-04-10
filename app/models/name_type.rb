class NameType < ActiveRecord::Base
	has_many :herb_names

	def to_s 
		"#{name_type}"
	end
end
