class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phoneNumber
      t.string :address
      t.string :city
      t.string :state
      t.integer :countPets

      t.timestamps null: false
    end
  end
end
