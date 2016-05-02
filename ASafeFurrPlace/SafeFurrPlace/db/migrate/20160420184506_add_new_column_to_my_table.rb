class AddNewColumnToMyTable < ActiveRecord::Migration
  def change
  	add_column :documents, :animalname, :string
  	add_column :documents, :animalabout, :string
  end
end
