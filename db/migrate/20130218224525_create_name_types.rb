class CreateNameTypes < ActiveRecord::Migration
  def change
    create_table :name_types do |t|
      t.string :name_type, :null => false

      t.timestamps
    end
  end
end
