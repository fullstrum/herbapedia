class CreateHerbsPropertiesJoin < ActiveRecord::Migration
  def up
    create_table 'herbs_properties', :id => false do |t|
    	t.column 'herb_id', :integer
    	t.column 'property_id', :integer
      
    end
  end

  def down
  	drop_table 'herbs_properties'
  end
end
