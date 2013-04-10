class HerbName < ActiveRecord::Base
	attr_accessible :name_type_id, :primary, :pronunciation, :name
	belongs_to :herb
	belongs_to :name_type
end
