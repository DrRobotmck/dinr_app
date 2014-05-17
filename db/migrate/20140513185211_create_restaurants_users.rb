class CreateRestaurantsUsers < ActiveRecord::Migration
  def change
    create_table :restaurants_users do |t|
    	t.references :user
    	t.references :restaurant
    end
  end
end
