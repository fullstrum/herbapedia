class CreateFolkUses < ActiveRecord::Migration
  def change
    create_table :folk_uses do |t|
      t.text :content, :null => false
      t.integer :herb_id, :null => false

      t.timestamps
    end
  end
end
