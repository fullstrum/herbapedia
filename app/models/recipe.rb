class Recipe < ActiveRecord::Base
	has_and_belongs_to_many :medicinals
	has_many :recipe_ingredients
	has_many :ingredients, :through => :recipe_ingredients

	attr_accessible :directions, :recipe_ingredients_attributes
	accepts_nested_attributes_for :recipe_ingredients
end
