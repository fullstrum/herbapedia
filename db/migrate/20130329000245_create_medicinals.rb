class CreateMedicinals < ActiveRecord::Migration
  def change
    create_table :medicinals do |t|
      t.text :content, :null => false
      t.integer :herb_id, :null => false

      t.timestamps
    end
  end
end
