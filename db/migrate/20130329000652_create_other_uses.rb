class CreateOtherUses < ActiveRecord::Migration
  def change
    create_table :other_uses do |t|
      t.text :content, :null => false
      t.integer :herb_id, :null => false

      t.timestamps
    end
  end
end
