class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.string :quantity
      t.string :measure
      t.string :prep_notes

      t.timestamps
    end
  end
end
