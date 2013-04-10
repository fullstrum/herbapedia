class FixColumnName < ActiveRecord::Migration
  def up
  	rename_column :properties, :type, :property_type
  end

  def down
  end
end
