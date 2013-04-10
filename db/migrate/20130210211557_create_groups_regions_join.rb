class CreateGroupsRegionsJoin < ActiveRecord::Migration
  def up
  	create_table 'groups_regions', :id => false do |t|
  		t.column 'group_id', :integer
  		t.column 'region_id', :integer
  	end
  end

  def down
  	drop_table 'groups_regions'
  end
end
