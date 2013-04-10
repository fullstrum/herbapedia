class CreateCulinaries < ActiveRecord::Migration
  def change
    create_table :culinaries do |t|
      t.text :content, :null => false
      t.integer :herb_id, :null => false

      t.timestamps
    end
  end
end
