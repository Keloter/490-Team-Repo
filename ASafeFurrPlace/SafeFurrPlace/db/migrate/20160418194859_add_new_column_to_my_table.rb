class AddNewColumnToMyTable < ActiveRecord::Migration
  def change
  	add_column :documents, :animalabout, :string
  	add_column :documents, :animalname, :string
  end
end
