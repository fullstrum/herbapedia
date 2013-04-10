class CreateCosmeticRecipe < ActiveRecord::Migration
  def up
  	create_table :cosmetics_recipes, :id => false do |t|
  		t.references :cosmetic, :recipe
  	end
  end

  def down
  end
end
