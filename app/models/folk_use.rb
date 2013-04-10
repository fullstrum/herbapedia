class FolkUse < ActiveRecord::Base
	attr_accessible :content
	belongs_to :herb
end
