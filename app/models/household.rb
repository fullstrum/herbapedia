class Household < ActiveRecord::Base
	attr_accessible :content
	belongs_to :herb
end
