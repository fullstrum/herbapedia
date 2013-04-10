class CreateMedicinalRecipe < ActiveRecord::Migration
  def up
  	create_table :medicinal_recipes, :id => false do |t|
  		t.references :medicinal, :recipe
  	end
  end

  def down
  end
end
