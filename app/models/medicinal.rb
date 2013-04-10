class Medicinal < ActiveRecord::Base
	attr_accessible :content, :recipes_attributes
	belongs_to :herb
	has_and_belongs_to_many :recipes

	accepts_nested_attributes_for :recipes
end
