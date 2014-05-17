class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
    	t.integer :camis, null: false
    	t.string :name
    	t.string :address
    	t.integer :zip
    	t.string :boro
    	t.string :grade
    	t.float :lat
    	t.float :long

    	t.timestamps
    end
  end
end
