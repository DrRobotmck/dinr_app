class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
    	t.belongs_to :restaurant
    	t.integer :score
    	t.string :violation
    	t.date :inspected_on
    end
  end
end
