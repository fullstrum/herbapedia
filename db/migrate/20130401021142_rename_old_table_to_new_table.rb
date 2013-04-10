class RenameOldTableToNewTable < ActiveRecord::Migration
  def up
  	rename_table :medicinal_recipes, :medicinals_recipes
  end

  def down
  end
end
