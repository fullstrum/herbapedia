class AddFieldnameToHerb < ActiveRecord::Migration
  def change
    add_column :herbs, :constituents, :text
  end
end
