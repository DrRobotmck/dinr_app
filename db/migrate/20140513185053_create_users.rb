class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :user, null: false
    	t.string :email, null: false
    	t.string :password_digest, null: false

    	t.timestamps
    end
  end
end
