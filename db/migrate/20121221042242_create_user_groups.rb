class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end

    add_index :user_groups, :user_id
    add_index :user_groups, [:user_id, :group_id], unique: true
  end
end
