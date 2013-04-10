class RecipeIngredient < ActiveRecord::Base
	attr_accessible :quantity, :measure, :prep_notes
	belongs_to :recipe
	belongs_to :ingredient 
end
