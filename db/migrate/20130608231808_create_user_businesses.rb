class CreateUserBusinesses < ActiveRecord::Migration
  def up
  	create_table :user_businesses do |t|
  		t.integer :user_id
  		t.integer :business_id
  		t.timestamps
  	end
  end

  def down
  	drop_table :user_businesses
  end
end
