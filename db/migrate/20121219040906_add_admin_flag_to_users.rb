class AddAdminFlagToUsers < ActiveRecord::Migration
  def up
    add_column :users, :admin, :bool, :null => false, :default => false 

    User.create! do |r|
      r.firstName  = 'admin'
      r.lastName   = 'user'
      r.email      = 'admin@admin.com'
      r.password   = 'password'
      r.admin = true
    end
  end

  def down
    remove_column :users, :admin
    User.find_by_email('admin@admin.com').try(:delete)
  end
end
