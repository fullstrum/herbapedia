class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :type

      t.timestamps
    end
  end
end