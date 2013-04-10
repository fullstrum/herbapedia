class AddColumnToHerbs < ActiveRecord::Migration
  def change
    add_column :herbs, :history, :text
    add_column :herbs, :family, :string
    add_column :herbs, :cultivation, :text
    add_column :herbs, :toxicity, :text
    add_column :herbs, :medicinal, :text
    add_column :herbs, :culinary, :text
  end
end
