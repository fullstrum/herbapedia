class CreateFolkUseRecipe < ActiveRecord::Migration
  def up
  	create_table :folk_uses_recipes, :id => false do |t|
  		t.references :folk_use, :recipe
  	end
  end

  def down
  end
end
