class Violations < ActiveRecord::Migration
  def change
  	create_table :violations do |t|
  		t.string :violation_code
  		t.string :description

  		t.timestamps
  	end
  end
end
