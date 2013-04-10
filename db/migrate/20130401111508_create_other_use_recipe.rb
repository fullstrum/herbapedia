class CreateOtherUseRecipe < ActiveRecord::Migration
  def up
  	create_table :other_uses_recipes, :id => false do |t|
  		t.references :other_use, :recipe
  	end
  end

  def down
  end
end
