class CreateHerbs < ActiveRecord::Migration
  def change
    create_table :herbs do |t|
      t.text :description

      t.timestamps
    end
  end
end
