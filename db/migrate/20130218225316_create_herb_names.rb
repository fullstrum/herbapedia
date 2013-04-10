class CreateHerbNames < ActiveRecord::Migration
  def change
    create_table :herb_names do |t|
      t.string :name, :null => false
      t.integer :herb_id, :null => false
      t.string :pronunciation
      t.integer :name_type_id, :null => false
      t.boolean :primary, :default => false

      t.timestamps
    end
  end
end
