class RemoveColumns < ActiveRecord::Migration
  def up
  	remove_column :herbs, :medicinal
  	remove_column :herbs, :culinary
  end

  def down
  	add_column :herbs, :medicinal, :text
  	add_column :herbs, :culinary, :text
  end
end
