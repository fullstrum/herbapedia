class CreateCreateHerbRegionsJoins < ActiveRecord::Migration
  def up
    create_table 'herbs_regions', :id => false do |t|
    	t.column 'herb_id', :integer
    	t.column 'region_id', :integer
      
    end
  end

  def down
  	drop_table 'herbs_regions'
  end
end
