class CreateCulinaryRecipe < ActiveRecord::Migration
  def up
  	create_table :culinaries_recipes, :id => false do |t|
  		t.references :culinary, :recipe
  	end
  end

  def down
  end
end
